# HadronicLineshapes

[![Stable Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://mmikhasenko.github.io/HadronicLineshapes.jl/stable)
[![In development documentation](https://img.shields.io/badge/docs-dev-blue.svg)](https://mmikhasenko.github.io/HadronicLineshapes.jl/dev)
[![Build Status](https://github.com/mmikhasenko/HadronicLineshapes.jl/workflows/Test/badge.svg)](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions)
[![Test workflow status](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Test.yml/badge.svg?branch=main)](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Test.yml?query=branch%3Amain)
[![Lint workflow Status](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Lint.yml/badge.svg?branch=main)](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Lint.yml?query=branch%3Amain)
[![Docs workflow Status](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Docs.yml/badge.svg?branch=main)](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Docs.yml?query=branch%3Amain)

[![Coverage](https://codecov.io/gh/mmikhasenko/HadronicLineshapes.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/mmikhasenko/HadronicLineshapes.jl)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)
[![All Contributors](https://img.shields.io/github/all-contributors/mmikhasenko/HadronicLineshapes.jl?labelColor=5e1ec7&color=c0ffee&style=flat-square)](#contributors)

The `HadronicLineshapes` package provides a collection of models for describing hadronic scattering processes in particle physics. It supports the analysis of hadronic resonances by offering various lineshape functions and utilities for flexible mathematical operations.

## Exposed Types and Functions

The package exposes the following key types and functions:

- **`AbstractFlexFunc`**: Base type for flexible operations on lineshape functions.
- **Utility Types**:
    - **`WrapFlexFunction`**: Wraps functions for extended flexibility.
    - **`ComposeFlexFunc`**: Enables the composition of multiple functions.
    - **`ScaleFlexFunc`**: Allows scaling of functions.
    - **`ProductFlexFunc`**: Facilitates the creation of product functions.

- **Form Factors**:
    - **`BlattWeisskopf`**: Describes the Blatt-Weisskopf barrier factors.
    - **`MomentumPower`**: Represents momentum-dependent terms in scattering.

- **Lineshape Models**:
    - **`BreitWigner`**: Standard Breit-Wigner resonance model.
    - **`MultichannelBreitWigner`**: Breit-Wigner model extended to multiple channels.
    - **`Flatte`**: Model for resonances near a threshold with coupled channels.

- **Functions**:
    - **`breakup`**: Computes breakup momentum in two-body decays.
    - **`orbital_momentum`**: Computes the orbital momentum in scattering processes.

## Contributing

If you want to make contributions of any kind, please first that a look into our [contributing guide directly on GitHub](docs/src/90-contributing.md) or the [contributing page on the website](https://mmikhasenko.github.io/HadronicLineshapes.jl/dev/90-contributing/).

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
