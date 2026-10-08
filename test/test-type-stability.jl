using Test
using HadronicLineshapes

allocations(f, σ) = (f(σ); @allocated f(σ))

@testset "Type stability of lineshapes" begin
    bw = BreitWigner(; m = 1.5195, Γ = 0.0156, ma = 0.938, mb = 0.4937, l = 2, d = 1.5)
    mbw = MultichannelBreitWigner(1.5195, 0.0156, 0.938, 0.4937, 2, 1.5)
    fl = Flatte(;
        m = 0.98,
        gsq1 = 0.2,
        ma1 = 0.4937,
        mb1 = 0.4937,
        gsq2 = 0.1,
        ma2 = 0.14,
        mb2 = 0.55,
    )
    for f in (bw, mbw, fl)
        @test @inferred(f(2.4)) isa ComplexF64
        @test @inferred(f(2.4 + 0.1im)) isa ComplexF64
        @test allocations(f, 2.4) == 0
    end
    @test bw(2.4) ≈ -8.512514266855653 + 4.578021141306757im
    @test bw(2.4) ≈ mbw(2.4)
end

@testset "Runtime-l Blatt-Weisskopf matches BlattWeisskopf{L}" begin
    for l = 0:7, p in (0.3, 1.2, 0.5 + 0.1im)
        @test HadronicLineshapes.blatt_weisskopf(p, l, 1.5) ≈ BlattWeisskopf{l}(1.5)(p)
    end
    @test_throws ErrorException HadronicLineshapes.blatt_weisskopf(0.3, 8, 1.5)
end

@testset "MultichannelBreitWigner constructors" begin
    @test MultichannelBreitWigner(1.6, 0.2)(2.2) ≈ BreitWigner(1.6, 0.2)(2.2)
end
