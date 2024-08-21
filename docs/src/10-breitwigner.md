# [Lineshape Parametrizations](@id lineshape_parametrizations)

This page provides a description of the lineshape parametrizations used in the `HadronicLineshapes` package.
The implementation is consistent with the [Review on Resonances by Particle Data Group](https://pdg.lbl.gov/2024/web/viewer.html?file=../reviews/rpp2024-rev-resonances.pdf) up to an overall normalization factor.

## Breit-Wigner Function

The `BreitWigner` function is a simplest lineshape used to describe resonances in particle physics. It is defined as:

```math
BW(\sigma, m, \Gamma) = \frac{1}{m^2 - \sigma - i m \Gamma}
```

where:

- Variable $m$ is the resonance mass,
- Variable $\Gamma$ is the total decay width,
- Variable $\sigma$ is the Mandelstam variable denoting squared mass of the system.

This parametrization assumes a single channel decay with no form factors or orbital angular momentum contributions.
For an elastic resonance with `l`-wave a energy-dependent expression is used for the width,

```math
\Gamma(\sigma) = \Gamma_0 \left( \frac{q(\sigma)}{q_0} \right)^{2l+1} \frac{F_l^2(q(\sigma) d)}{F_l^2(q_0 d)}
```

where $q = q(\sqrt{\sigma}, m_1, m_2)$ is the momentum of the decay products in the center-of-mass frame,
and $q_0$ is the momentum evaluated for the nominal mass of the resonance.
By default, the Blatt-Weisskopf form factor are used for $F_l(q d)$.

!!! tip "Using the BreitWigner Function"
    To create a `BreitWigner` instance in the `HadronicLineshapes` package, you can use the following constructor:

    ```julia
    BreitWigner(m::Float64, Γ::Float64)
    BreitWigner(m::Float64, Γ::Float64, ma::Float64, mb::Float64, l::Int, d::Float64)
    ```

    For the first call, the default values for `ma`, `mb`, `l`, and `d` are set to `0.0`, `0.0`, `0`, and `1.0`, respectively, yielding the constant-width Breit-Wigner function.

## Multichannel Breit-Wigner Function

The `MultichannelBreitWigner` function extends the `BreitWigner` to multiple decay channels. Each channel can have its own mass thresholds, coupling constants, and orbital angular momentum contributions. The function is defined as:

```math
\text{MultichannelBW}(\sigma, m, \Gamma_i) = \frac{1}{m^2 - \sigma - i \sum_{k} g_k^2 \cdot \rho_k(\sigma)}
```

where:

- Variable $g_k^2$ are the coupling constants for each channel,
- Functions $\rho_k(\sigma) = 2q_k/\sqrt{\sigma}$ are the phase space factors for the respective channels.

The total decay width $\Gamma(\sigma)$ is the sum of partial widths across all channels.

!!! advice "Constructing a Multichannel Breit-Wigner"
    To create a `MultichannelBreitWigner`, you can specify the parameters for each channel as a `NamedTuple` within a vector. Here's an example:

    ```julia
    MultichannelBreitWigner(
        m::Real,
        channels::Vector{<:NamedTuple{(:gsq, :ma, :mb, :l, :d)}})
    ```

    Use the `BlattWeisskopf` form factor function as needed, and remember to ensure all channel parameters are consistent with the physics of your problem.

## Flatté Function

The `Flatté` function is a special case of the `MultichannelBreitWigner` designed to describe resonances with two S-wave channels.
The function is expressed as:

```math
\text{Flatté}(\sigma) = \frac{1}{m^2 - \sigma - i \left( g_1^2 \cdot \rho_1(\sigma) + g_2^2 \cdot \rho_2(\sigma) \right)}
```

where:

- Variables $g_1$ and $g_2$ are the coupling constants for the two channels,
- Functions $\rho_1(\sigma)$ and $\rho_2(\sigma)$ are the corresponding phase space factors.

!!! tip "Using Flatté function"
    When implementing the `Flatté` function, use the `MultichannelBreitWigner` as a base and define the parameters for each of the two channels. Example instantiation:

    ```julia
    Flatte(m, gsq1, ma1, mb1, gsq2, ma2, mb2) # with Float64 parameters
    ```

    This function is widely used for resonances like the $f_0(980)$ with $\pi\pi$ and $K\bar{K}$ channels.
