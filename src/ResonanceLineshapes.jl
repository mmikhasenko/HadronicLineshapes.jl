module ResonanceLineshapes

using Parameters

export AbstractFlexFunc
export UnionFlexFunc
export WrapFlexFunction
export ComposeFlexFunc
export ScaleFlexFunc
export ProductFlexFunc
import Base: *
include("operations.jl")

export BlattWeisskopf
include("formfactors.jl")

export BreitWigner
include("shapes.jl")

end # module ResonanceLineshapes
