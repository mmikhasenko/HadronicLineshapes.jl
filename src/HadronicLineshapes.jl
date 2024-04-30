module HadronicLineshapes

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
include("formfactors.jl")

export BreitWigner
export MultichannelBreitWigner
include("shapes.jl")

end # module HadronicLineshapes
