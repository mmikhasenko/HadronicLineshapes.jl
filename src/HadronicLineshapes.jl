module HadronicLineshapes

using StaticArrays
using Parameters

export AbstractFlexFunc
export UnionFlexFunc
export WrapFlexFunction
export ComposeFlexFunc
export ScaleFlexFunc
export ProductFlexFunc
import Base: *
include("operations.jl")

export breakup
export BlattWeisskopf
export MomentumPower
include("formfactors.jl")

export BreitWigner
export MultichannelBreitWigner
export Flatte
include("shapes.jl")

end # module HadronicLineshapes
