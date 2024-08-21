```@meta
CurrentModule = HadronicLineshapes
```

# HadronicLineshapes

The `HadronicLineshapes` a Julia package provides models for description of hadronic scattering processes within particle physics.

## Installation

To install `HadronicLineshapes`, use the Julia package manager. From the Julia REPL, enter package mode by pressing `]`, then run:

```julia
pkg> add https://github.com/mmikhasenko/HadronicLineshapes.jl
```

Ensure that you have Julia installed on your system and that the `Parameters` package, a dependency of `HadronicLineshapes`, is also installed using the same method.

## Usage and API Reference

### Basic Usage

```julia
using HadronicLineshapes

# Create a Breit-Wigner
bw = BreitWigner(1.6, 0.2) # constant-width lineshape function
bw = BreitWigner(1.6, 0.2, 0.1, 0.2, 1, 1.5) # P-wave
bw = BreitWigner(; m = 1.6, Γ = 0.2, ma = 0.1, mb = 0.2, l = 1, d = 1.5) # same as above
#
mbw = MultichannelBreitWigner(
    1.6,
    [
        (gsq = 0.35, ma = 0.1, mb = 0.2, l = 0, d = 1.0),
        (gsq = 0.35, ma = 0.3, mb = 0.25, l = 0, d = 1.5),
    ],
)
mbw = Flatte(1.6, 0.35, 0.1, 0.2, 0.35, 0.3, 0.25) # same as above
```

See detailed definition in [lineshape documentation](10-breitwigner.md)

### API Overview

All of the lineshapes are inherited from `AbstractFlexFunc` enabling mathematical operations
on the functions like multiplication and composition.

- `AbstractFlexFunc`: Base type for flexible function operations.
- `WrapFlexFunction`: a simple wrapper for a lambda function.
- `ComposeFlexFunc`: a composition of two functions `f(g(x))`.
- `ScaleFlexFunc`: a scaled version of a function `f(x) * a`.
- `ProductFlexFunc`: a product of two functions `f(x) * g(x)`.

## Contributors

```@raw html
<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
```
