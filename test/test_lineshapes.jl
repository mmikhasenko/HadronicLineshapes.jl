using Test
using HadronicLineshapes

# BreitWigner fixed width
Γ0 = 0.2
bw = BreitWigner(1.6, Γ0)
@testset "BW call" begin
    @test bw(bw.m^2) ≈ 1im / bw.m / Γ0
    refA = -1.2039660056657226 + 0.5665722379603404im
    @test bw((bw.m + Γ0)^2) ≈ refA
end

bw1 = BreitWigner(; m=1.6, Γ=0.2, ma=0.1, mb=0.2, l=1, d=1.5)
bw2 = MultichannelBreitWigner(1.6, 0.2, 0.1, 0.2, 1, 1.5)

@testset "BreitWigner is the same as MultichannelBreitWigner with one channel" begin
    @test bw1(2.2) ≈ bw2(2.2)
    refA = 1.6503335292467654 + 1.3640597661785752im
    @test bw1(2.2) ≈ refA
end

# Flatte

bw1 = MultichannelBreitWigner(1.6,
    [(gsq=0.35, ma=0.1, mb=0.2, l=0, d=1.0),
        (gsq=0.35, ma=0.3, mb=0.25, l=0, d=1.5)])
bw2 = Flatte(1.6,
    0.35, 0.1, 0.2,
    0.35, 0.3, 0.25)
@testset "Flatte is a l=0 case of MultichannelBreitWigner with 2 channels" begin
    @test bw1(2.2) ≈ bw2(2.2)
    refA = 0.28391117207354793 + 0.8414491018597429im
    @test bw1(2.2) ≈ refA
end


# BlattWeisskopf

bw0 = BlattWeisskopf{0}(1.5)
bw1 = BlattWeisskopf{1}(1.5)
bw2 = BlattWeisskopf{2}(1.5)
bw3 = BlattWeisskopf{3}(1.5)

@testset "BlattWeisskopf" begin
    @test bw0(0.0) == 1.0
    @test bw1(0.0) == bw2(0.0) == bw3(0.0) == 0.0
    @test bw0(1.1) > bw1(1.1) > bw2(1.1) > bw3(1.1)
    refs = (1, 0.9761870601839528, 0.924462392487166, 0.8353277954487898)
    @test all((bw0(3), bw1(3), bw2(3), bw3(3)) .≈ refs)
end

bw1_of_sq = bw1(z -> z^2)
bw0_scale = bw0 * 5.5
X = bw * bw3
kill_dep = bw(bw0)

@testset "Operations" begin
    @test bw1(2.5^2) == bw1_of_sq(2.5)
    @test bw0_scale(2.5^2) == 5.5
    ref = 0.002582023399904232 + 0.00036559623361475844im
    @test X(0.3) ≈ ref
    @test kill_dep(4.4) == bw(1.0)
end

# test ComposeFlexFunc AbstractFlexFunc of Function
square(x) = abs2(x)
bw = BreitWigner(1.6, 0.2)
bw_e = bw(square)
bw_square = WrapFlexFunction(square)(bw)
@testset "ComposeFlexFunc" begin
    @test bw_e(1.6) ≈ 1im / 1.6 / 0.2
    @test bw_square(1.6^2) ≈ 1 / (1.6 * 0.2)^2
end


