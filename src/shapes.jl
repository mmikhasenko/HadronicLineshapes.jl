# Lineshapes
# 

BW(σ, m, Γ) = 1 / (m^2 - σ - 1im * m * Γ)

@with_kw struct MultichannelBreitWigner{N} <: AbstractFlexFunc
    m::Float64
    channels::SVector{N,<:NamedTuple{(:gsq, :ma, :mb, :l, :d)}}
end

# MultichannelBreitWigner constructor from Vector
function MultichannelBreitWigner(m::Real, channels::Vector{<:NamedTuple{(:gsq, :ma, :mb, :l, :d)}})
    N = length(channels)
    return MultichannelBreitWigner(m, SVector{N}(channels...))
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

function MultichannelBreitWigner(m::Real, Γ::Real, ma::Number, mb::Number, l::Int, d::Real)
    _p0 = breakup(m, ma, mb)
    FF = BlattWeisskopf{l}(d)
    gsq = Γ / (2_p0) * m / FF(_p0)^2
    return MultichannelBreitWigner(m, SVector((; gsq, ma, mb, l, d)))
end
MultichannelBreitWigner(m::Float64, Γ::Float64) =
    MultichannelBreitWigner{1}(m, Γ, 0.0, 0.0, 0, 1.0)

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
    @unpack m, ma, mb, l, d = bw
    _p0 = breakup(m, ma, mb)
    FF = BlattWeisskopf{l}(d)
    gsq = bw.Γ / (2_p0) * m / FF(_p0)^2
    mbw = MultichannelBreitWigner(m, SVector((; gsq, ma, mb, l, d)))
    mbw(σ)
end

