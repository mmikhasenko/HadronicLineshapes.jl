#md # # Tutorial
#nb # # HadronicLineshapes.jl Tutorial
#jl # # HadronicLineshapes.jl Tutorial

# This tutorial demonstrates how to use HadronicLineshapes.jl to model
# hadronic resonance lineshapes and form factors.

using HadronicLineshapes
using Plots

theme(:boxed)

# ## Basic Breit-Wigner Functions

# Simple constant-width Breit-Wigner
# and an energy-dependent Breit-Wigner with form factors are created as follows

bw1 = BreitWigner(1.5, 0.1);  # mass=1.5 GeV, width=0.1 GeV
bw2 = BreitWigner(1.5, 0.1, 0.5, 0.3, 1, 1.0);  # ma=0.5, mb=0.3, l=1, d=1.0

# They shapes are similar since the channel threshold at 0.3+0.5 = 0.9 GeV is far away from the nominal mass of 1.5 GeV.

let
    m_range = range((bw1.m .+ bw1.Γ .* [-5, 3])..., 100)
    plot(xlab = "m (GeV)", ylab = "|BW|²")
    plot!(m_range, m -> bw1(m^2) |> abs2, label = "Constant width", lw = 2)
    plot!(m_range, m -> bw2(m^2) |> abs2, label = "Energy dependent", lw = 2)
end

# Let's take a more complex example with two channels with different masses and couplings.

bw3 = MultichannelBreitWigner(  # Two-channel Breit-Wigner
    1.5,
    [
        (gsq = 0.18, ma = 0.1, mb = 0.5, l = 1, d = 1.5),
        (gsq = 0.3, ma = 1.25, mb = 0.15, l = 0, d = 1.5),
    ],
);

# The coupling of the first channel is adjusted to have a similar width as `bw1`, the second channel in S-wave is introduced to show a prominent distortion of the shape.

let
    m_range = range((bw1.m .+ bw1.Γ .* [-5, 3])..., 200)
    plot(xlab = "m (GeV)", ylab = "|BW|²")
    plot!(m_range, m -> bw2(m^2) |> abs2, label = "Energy dependent", lw = 2)
    plot!(m_range, m -> bw3(m^2) |> abs2, label = "Two-channel BW", lw = 2)
    vspan!(bw3.channels[2].ma .+ [-1, 1] .* bw3.channels[2].mb, lc = :gray, alpha = 0.1)
    vline!(bw3.channels[2].ma .+ [-1, 1] .* bw3.channels[2].mb, lc = :gray)
    annotate!(bw3.channels[2].ma, 20, text("channel-2 momentum\nis complex", :center, 10))
end

# Evaluation of the momentum below the threshold is working does to the following line,
# ```julia
# (bw::MultichannelBreitWigner)(σ::Real) = (bw)(σ + 1im * eps())
# ```
# When real value is passed, it's casted to a complex number with a small imaginary part.

# ## Form Factors

# Blatt-Weisskopf form factors for different orbital angular momenta
ff_s = BlattWeisskopf{0}(1.5);  # S-wave
ff_p = BlattWeisskopf{1}(1.5);  # P-wave
ff_d = BlattWeisskopf{2}(1.5);  # D-wave

# The function are normalized such that they approch 1.0 asymptotically as p -> ∞.

let
    p_max = 10.0
    p_range = 0.0:0.01:p_max
    plot(title = "Blatt-Weisskopf form factors", xlab = "p (GeV)", ylab = "|F|² / N")
    for l = 0:7
        d = 1.5
        ff = BlattWeisskopf{l}(1.5)
        plot!(p_range, p -> ff(p), label = "l=$l", lw = 2)
    end
    plot!(ylims = (0, 1.1), leg = :bottomright)
end

# ## Operations

# Combine functions using arithmetic operations
combined = 2.0 * bw1 + 1.5 * bw2
@show combined(2.0)

# Compose functions
composed = bw1(abs)  # apply absolute value to input
@show composed(-2.0)
