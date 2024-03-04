# ResonanceLineshapes.jl

## Context

The `ResonanceLineshapes` package is designed for the study of hadron reactions through resonance modeling. It facilitates the application of reaction theory to describe interactions within particle physics, providing a robust framework for analyzing resonance phenomena. This Julia package introduces a comprehensive approach to model resonance lineshapes, crucial for the theoretical understanding and experimental analysis of hadron reactions.

## Installation

To install `ResonanceLineshapes`, use the Julia package manager. From the Julia REPL, enter package mode by pressing `]`, then run:

```julia
pkg> add https://github.com/mmikhasenko/ResonanceLineshapes.jl
```

Ensure that you have Julia installed on your system and that the `Parameters` package, a dependency of `ResonanceLineshapes`, is also installed using the same method.

## Usage and API Reference

### Basic Usage

```julia
using ResonanceLineshapes

# Create a Breit-Wigner constant-width lineshape function
bw = BreitWigner(1.6, 0.2)
```

See model in [src/shapes.jl](src/shapes.jl).

### API Overview

All of the lineshapes are inhereted from `AbstractFlexFunc` enabling mathematical operations
on the functions like multiplication and composition.

- **`AbstractFlexFunc`**: Base type for flexible function operations.

- **Utility Types and Functions**:
  - `UnionFlexFunc`
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

Contributions to `ResonanceLineshapes` are welcome.
To contribute, please submit a pull request or open an issue for discussion regarding bugs or feature requests.

## License

`ResonanceLineshapes` is licensed under the MIT License. See the LICENSE file in the project repository for more details.

## References

- JPAC Group: [https://www.jpac-physics.org/](https://www.jpac-physics.org/)
- Reaction Theory Schools: [http://jpac.nucleares.unam.mx/schools.html](http://jpac.nucleares.unam.mx/schools.html)
