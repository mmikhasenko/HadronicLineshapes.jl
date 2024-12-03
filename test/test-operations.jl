# FILE: test/test_operations.jl
using Test
using HadronicLineshapes

# Define some sample functions
f1(x) = x + 1
f2(x) = x * 2

# Wrap the functions in WrapFlexFunction
wf1 = WrapFlexFunction(f1)
wf2 = WrapFlexFunction(f2)

# Create SumFlexFunc instances
sum_ff = wf1 + wf2
sum_f_func = wf1 + f2
sum_func_f = f1 + wf2

@testset "SumFlexFunc" begin
    @test sum_ff(2) == f1(2) + f2(2)
    @test sum_f_func(2) == f1(2) + f2(2)
    @test sum_func_f(2) == f1(2) + f2(2)
end


# Create ProductFlexFunc instances
prod_ff = wf1 * wf2
prod_f_func = wf1 * f2
prod_func_f = f1 * wf2

@testset "ProductFlexFunc" begin
    @test prod_ff(2) == f1(2) * f2(2)
    @test prod_f_func(2) == f1(2) * f2(2)
    @test prod_func_f(2) == f1(2) * f2(2)
end
