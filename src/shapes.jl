# Lineshapes
# 

BW(σ, m, Γ) = 1 / (m^2 - σ - 1im * m * Γ)

@with_kw struct MultichannelBreitWigner <: AbstractFlexFunc
    m::Float64
    channels::AbstractVector{<:NamedTuple{(:gsq, :ma, :mb, :l, :d)}}
end
function (bw::MultichannelBreitWigner)(σ::Number)
    m0 = bw.m
    Γ = sum(bw.channels) do channel
        @unpack gsq, ma, mb, l, d = channel
        FF = BlattWeisskopf{l}(d)
        _p = breakup(sqrt(σ), ma, mb)
        gsq * 2_p / sqrt(σ) * FF(_p)^2
    end
    BW(σ, m0, Γ)
end

MultichannelBreitWigner(m::Float64, Γ::Float64) = MultichannelBreitWigner(m, [(gsq=Γ, ma=0.0, mb=0.0, l=0, d=1.0)])
function MultichannelBreitWigner(m::Real, Γ::Real, ma::Number, mb::Number, l::Int, d::Real)
    _p0 = breakup(m, ma, mb)
    FF = BlattWeisskopf{l}(d)
    gsq = Γ / (2_p0) * m / FF(_p0)^2
    return MultichannelBreitWigner(m, [(; gsq, ma, mb, l, d)])
end

# const BreitWigner = MultichannelBreitWigner{1}

@with_kw struct BreitWigner <: AbstractFlexFunc
    m::Float64
    Γ::Float64
    ma::Float64
    mb::Float64
    l::Int
    d::Float64
end

BreitWigner(m::Float64, Γ::Float64) = BreitWigner(; m, Γ, ma=0.0, mb=0.0, l=0, d=1.0)

function (bw::BreitWigner)(σ::Number)
    m0 = bw.m
    FF = BlattWeisskopf{bw.l}(bw.d)
    _p, _p0 = breakup(sqrt(σ), bw.ma, bw.mb), breakup(m0, bw.ma, bw.mb)
    Γ = bw.Γ * _p / _p0 * m0 / sqrt(σ) * FF(_p)^2 / FF(_p0)^2
    BW(σ, m0, Γ)
end

