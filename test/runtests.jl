using TulipaProfileFitting
using Test

@testset "TulipaProfileFitting.jl" begin
    profile_values = [0.2,0.5,0.9,1.0,0.4,0.1,0.0]
    target_mean = 0.5
    coefficient = fit_profile(profile_values, target_mean)
    @test coefficient ≈ 0.7491921789832345 atol=0.01
end
