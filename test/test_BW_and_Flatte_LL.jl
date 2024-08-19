using HadronicLineshapes
using Parameters
using Test


# The code used in Lb2Lg amplitude analysis

const mΛb = 5.620
const mp = 0.938
const mK = 0.493
const mγ = 0
const mπ = 0.14
const mΣ = 1.197

@with_kw struct Flatte1405
    m0::Float64
    Γ0::Float64
    L::Int
    l::Int
end

function _invF²(l, z²)
    l == 0 && return one(z²)
    l == 1 && return 1 + z²
    l == 2 && return 9 + 3z² + z²^2
    l == 3 && return 225 + 45z² + 6z²^2 + z²^3
    l == 4 && return 11025 + 1575z² + 135z²^2 + 10z²^3 + z²^4
    l == 5 && return 893025 + 99225z² + 6300z²^2 + 315z²^3 + 15z²^4 + z²^5
    l > 5 && error("l > 5 are not implemented")
    return one(z²)
end
_h(z, l::Int) = 1 / sqrt(_invF²(l, z^2))

_BW(σ, m, Γ) = 1 / (m^2 - σ - 1im * m * Γ)
_Kallen(x, y, z) = x^2 + y^2 + z^2 - 2x * y - 2y * z - 2z * x
_breakup(m0sq, m1sq, m2sq) = sqrt(_Kallen(m0sq, m1sq, m2sq)) / (2sqrt(m0sq))
function (lineshape::Flatte1405)(σ)
    (; m0, Γ0, L, l) = lineshape
    l != 0 && error("Not intended to be calle with l!=0, l=$l")
    m1, m2 = mK, mp
    _p = _breakup(σ, m1^2, m2^2)
    _p′, _p0′ = _breakup(σ, mπ^2, mΣ^2), _breakup(m0^2, mπ^2, mΣ^2)
    Γ1 = Γ0 * (_p / _p0′) * m0 / sqrt(σ)
    Γ2 = Γ0 * (_p′ / _p0′) * m0 / sqrt(σ)
    Γ = Γ1 + Γ2
    R5 = 5
    _q, _q0 = _breakup(mΛb^2, σ, 0^2), _breakup(mΛb^2, m0^2, 0^2)
    return _BW(σ, m0, Γ) * (_q / _q0)^L * _h(_q * R5, L) / _h(_q0 * R5, L)
end


reference_shape = Flatte1405(l = 0, m0 = 1.405, Γ0 = 0.0505, L = 5)

# Implementation using HadronicLineshapes.jl building blocks
shape = let
    @unpack m0, Γ0, L = reference_shape
    #
    _p0′ = breakup(m0, mπ, mΣ)
    gsq = Γ0 / (2_p0′) * m0
    bw = MultichannelBreitWigner(
        m = m0,
        channels = [
            (; gsq, ma = mp, mb = mK, l = 0, d = 0),
            (; gsq, ma = mΣ, mb = mπ, l = 0, d = 0),
        ],
    )
    #
    R5 = 5.0
    ff = BlattWeisskopf{L}(R5)
    normalization = 1 / ff(breakup(mΛb, m0, 0))
    bw * ff(σ -> breakup(mΛb, sqrt(σ), 0)) * normalization
end

@testset "Flatte1405" begin
    @test reference_shape(1.5^2) ≈ shape(1.5^2) ≈ -2.268218968333875 + 1.7510620457952242im
    @test reference_shape(2.5^2) ≈
          shape(2.5^2) ≈
          -0.22568090542208105 + 0.029085847195023364im
end

# Implementation from scratch
@with_kw struct _BreitWignerFF_lL
    m0::Float64
    Γ0::Float64
    L::Int
    l::Int
end
function (lineshape::_BreitWignerFF_lL)(σ::Float64)
    (; m0, Γ0, L, l) = lineshape
    _q = _breakup(mΛb^2, σ, 0.0^2)
    _p = _breakup(σ, mp^2, mK^2)
    _q0 = _breakup(mΛb^2, m0^2, 0.0^2)
    _p0 = _breakup(m0^2, mp^2, mK^2)
    #
    R5 = 5
    R1 = 1.5 # 1/GeV
    Γ = Γ0 * (_p / _p0)^(2l + 1) * m0 / sqrt(σ) * _h(_p * R1, l)^2 / _h(_p0 * R1, l)^2
    #
    return _BW(σ, m0, Γ) * (_q / _q0)^L * _h(_q * R5, L) / _h(_q0 * R5, L) *
           (_p / _p0)^l *
           _h(_p * R1, l) / _h(_p0 * R1, l)
end

# Reimplementation using `ResoananceLineshapes.jl`
function BreitWignerFF_lL(; m0, Γ0, L, l)
    R1, R5 = 1.5, 5.0
    bw = BreitWigner(m0, Γ0, mp, mK, l, R1)
    #
    p(σ) = breakup(sqrt(σ), mp, mK)
    ff_decay = BlattWeisskopf{l}(R1)(p)
    q(σ) = breakup(mΛb, sqrt(σ), 0)
    ff_production = BlattWeisskopf{L}(R5)(q)
    ff = ff_production * ff_decay
    #
    bw * ff * (1 / ff(m0^2))
end


L1820 = (l = 3, m0 = 1.82, Γ0 = 0.08, L = 2)
L1520 = (l = 2, m0 = 1.519, Γ0 = 0.016, L = 3)
L1810 = (l = 1, m0 = 1.79, Γ0 = 0.11, L = 5)

for L in (L1820, L1520, L1810)
    _shape = BreitWignerFF_lL(; L...)
    _reference_shape = _BreitWignerFF_lL(; L...)
    # σ = 1.5ˆ2
    @test _reference_shape(1.5^2) ≈ _shape(1.5^2)
    @test _reference_shape(1.5^2) ≈ _shape(1.5^2)
    # σ = 2.5ˆ2
    @test _reference_shape(2.5^2) ≈ _shape(2.5^2)
    @test _reference_shape(2.5^2) ≈ _shape(2.5^2)
end
