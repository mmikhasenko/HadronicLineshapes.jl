# [Form Factor Parametrizations](@id form_factor_parametrizations)

This page provides a description of the form factor parametrizations used in the `HadronicLineshapes` package.
The implementation is consistent with the [Review on Resonances by Particle Data Group](https://pdg.lbl.gov/2024/web/viewer.html?file=../reviews/rpp2024-rev-resonances.pdf) up to an overall normalization factor.

The form-factor is a function that provide an energy-behavior to a one-to-two transition amplitude.
The physical interpretation of commonly-used form factors is limited. This package implements,
```julia
BlattWeisskopf{L}(d::Float64)
MomentumPower{L}()
```

Both form-factors can be called on a single momentum variable `p`, but also on squared masses of the decay products,
```julia
ff(p) # as a function of momentum
ff(m0^2, m1^2, m2^2) # computes momentum from masses and calls ff(p)
```

## Blatt-Weisskopf Form Factors

The `BlattWeisskopf` form factors are used to regularize $p^l$ behavior of partial waves with orbital angular momentum $l$. The factors appear in the parametrization of enertgy-dependent width of resonances,
and in the vertex functions when describing amplitude with fixed orbital angular momentum, e.g using spin-orbit coupling in hadronic decays.
They are defined as:

```math
F_l^2(z) = \frac{z^{2l}}{\chi_l(z^2)}
```

where:
- $z = d \cdot p$ is the scaled momentum
- $d$ is the scale parameter (typically the interaction radius)
- $p$ is the breakup momentum
- $\chi_l(z^2)$ is an order-$l$ polynomial of $z^2$

The function returns $F_l$, taking a square root of the $F_l^2$ expression.


!!! tip "Form Factor Selection"
    Form factors can be called with either momentum or squared masses:

    ```julia
    ff = BlattWeisskopf{1}(1.5) # P-wave
    # explicit way: compute momentum first
    p = breakup(m0, m1, m2)
    result = ff(p)
    # concise way: pass squared masses directly
    result = ff(m0^2, m1^2, m2^2)
    ```

    The package supports Blatt-Weisskopf form factors for orbital angular momentum $l = 0, 1, 2, 3, 4, 5, 6, 7$.


## Momentum Power Form Factors

The `MomentumPower` form factors represent simple momentum-dependent terms in scattering:

```math
F_l(p) = p^l
```

where $p$ is the breakup momentum and $l$ is the orbital angular momentum.

!!! tip "Momentum Power Form Factors"
    The constructor for `MomentumPower` is simply `MomentumPower{L}()`, here $L$ is used as a part of the type parameter.

    ```julia
    pL0 = MomentumPower{0}()  # Constant (S-wave)
    pL1 = MomentumPower{1}()  # Linear (P-wave)
    pL2 = MomentumPower{2}()  # Quadratic (D-wave)
    ```
