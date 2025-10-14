# HadronicLineshapes

[![Documentation](https://img.shields.io/badge/docs-dev-blue.svg)](https://mmikhasenko.github.io/HadronicLineshapes.jl/dev)
[![Build Status](https://github.com/mmikhasenko/HadronicLineshapes.jl/workflows/Test/badge.svg)](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions)
[![Test workflow status](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Test.yml/badge.svg?branch=main)](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Test.yml?query=branch%3Amain)
[![Lint workflow Status](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Lint.yml/badge.svg?branch=main)](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Lint.yml?query=branch%3Amain)
[![Docs workflow Status](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Docs.yml/badge.svg?branch=main)](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Docs.yml?query=branch%3Amain)

[![Coverage](https://codecov.io/gh/mmikhasenko/HadronicLineshapes.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/mmikhasenko/HadronicLineshapes.jl)

The `HadronicLineshapes` package provides a collection of models for describing hadronic scattering processes in particle physics. It supports the analysis of hadronic resonances by offering various lineshape functions and utilities for flexible mathematical operations.

## Exposed Types and Functions

The package exposes the following key types and functions:

- Lineshape models:
    - `BreitWigner`: Standard Breit-Wigner resonance model.
    - `MultichannelBreitWigner`: Breit-Wigner model extended to multiple channels.
    - `Flatte`: Model for resonances near a threshold with coupled channels.

- Form factors:
    - `BlattWeisskopf`: Describes the Blatt-Weisskopf barrier factors.
    - `MomentumPower`: Represents momentum-dependent terms in scattering.

- Functions:
    - `breakup`: Computes breakup momentum in two-body decays.
    - `orbital_momentum`: Computes the orbital momentum in scattering processes.

All functions are inherited from `AbstractFlexFunc`, the base type that support arithmetic operations on functions. Particularly, the following operations are supported:

- `WrapFlexFunction`: Wraps functions for extended flexibility.
- `ComposeFlexFunc`: Enables the composition of multiple functions.
- `ScaleFlexFunc`: Allows scaling of functions.
- `ProductFlexFunc`: used to store a product of functions.
- `SumFlexFunc`: used to store a sum of functions.

## Contributing

Contributions are very welcome! I
Have a look at the [contributing guide directly on GitHub](docs/src/90-contributing.md) or the [contributing page on the website](https://mmikhasenko.github.io/HadronicLineshapes.jl/dev/90-contributing/).

## License

`HadronicLineshapes` is licensed under the MIT License. See the LICENSE file in the project repository for more details.

---

### Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
