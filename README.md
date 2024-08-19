# HadronicLineshapes

[![Stable Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://mmikhasenko.github.io/HadronicLineshapes.jl/stable)
[![In development documentation](https://img.shields.io/badge/docs-dev-blue.svg)](https://mmikhasenko.github.io/HadronicLineshapes.jl/dev)
[![Build Status](https://github.com/mmikhasenko/HadronicLineshapes.jl/workflows/Test/badge.svg)](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions)
[![Test workflow status](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Test.yml/badge.svg?branch=main)](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Test.yml?query=branch%3Amain)
[![Lint workflow Status](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Lint.yml/badge.svg?branch=main)](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Lint.yml?query=branch%3Amain)
[![Docs workflow Status](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Docs.yml/badge.svg?branch=main)](https://github.com/mmikhasenko/HadronicLineshapes.jl/actions/workflows/Docs.yml?query=branch%3Amain)

[![Coverage](https://codecov.io/gh/mmikhasenko/HadronicLineshapes.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/mmikhasenko/HadronicLineshapes.jl)
[![DOI](https://zenodo.org/badge/DOI/FIXME)](https://doi.org/FIXME)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)
[![All Contributors](https://img.shields.io/github/all-contributors/mmikhasenko/HadronicLineshapes.jl?labelColor=5e1ec7&color=c0ffee&style=flat-square)](#contributors)



## Context

The `HadronicLineshapes` package is designed for the study of hadron reactions through resonance modeling. It facilitates the application of reaction theory to describe interactions within particle physics, providing a robust framework for analyzing resonance phenomena. This Julia package introduces a comprehensive approach to model resonance lineshapes, crucial for the theoretical understanding and experimental analysis of hadron reactions.

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

# Create a Breit-Wigner constant-width lineshape function
bw = BreitWigner(1.6, 0.2)
```

See model in [src/shapes.jl](src/shapes.jl).

### API Overview

All of the lineshapes are inhereted from `AbstractFlexFunc` enabling mathematical operations
on the functions like multiplication and composition.

- **`AbstractFlexFunc`**: Base type for flexible function operations.

- **Utility Types and Functions**:
  - `WrapFlexFunction`
  - `ComposeFlexFunc`
  - `ScaleFlexFunc`
  - `ProductFlexFunc`

These types and functions provide a versatile set of tools for creating and manipulating lineshape functions, supporting operations like composition, scaling, and forming products.

## Test Cases

The package includes comprehensive tests covering various functionalities, including `BreitWigner` and `BlattWeisskopf` implementations and their operations. Users are encouraged to explore the test section for examples of validating the accuracy and performance of the lineshape functions and report the issues.


Here is an example of Blatt-Weisskopf form-factors for orbital momentum from 1 to 5.
```julia
let
    plot()
    map((1, 2, 3, 4, 5)) do l
        ff = BlattWeisskopf{l}(1.5)
        plot!(x -> ff(x), 0, 5.0)
    end
    plot!()
end
```

A comparison of a resonance lineshapes for different form-factors is constructed as below.
```julia
let m = 0.77, Γ = 0.15
    ρ(e) = sqrt(e - 0.28) # phase space stuff
    plot()
    bw = BreitWigner(m, Γ)
    plot!(0.28, 0.7, lab="const width") do e
        e * angle(bw(e^2))
    end
    bw = BreitWigner(m, Γ, 0.14, 0.14, 1, 5.0)
    plot!(0.28, 0.7, lab="P-wave (5/Gev)") do e
        e * angle(bw(e^2))
    end
    bw = BreitWigner(m, Γ, 0.14, 0.14, 1, 1.5)
    plot!(0.28, 0.7, lab="P-wave (1.5/Gev)") do e
        e * angle(bw(e^2))
    end
    vline!([m], lab="")
end
```

## Contributing

If you want to make contributions of any kind, please first that a look into our [contributing guide directly on GitHub](docs/src/90-contributing.md) or the [contributing page on the website](https://mmikhasenko.github.io/HadronicLineshapes.jl/dev/90-contributing/).


## License

`HadronicLineshapes` is licensed under the MIT License. See the LICENSE file in the project repository for more details.

## References

- JPAC Group: [https://www.jpac-physics.org/](https://www.jpac-physics.org/)
- Reaction Theory Schools: [http://jpac.nucleares.unam.mx/schools.html](http://jpac.nucleares.unam.mx/schools.html)

---

### Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

