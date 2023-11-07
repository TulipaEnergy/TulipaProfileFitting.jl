using TulipaProfileFitting
using Test

function test_fit_profile()

    # Test case 1: Using root finding method
    profile_values = [0.2, 0.5, 0.9, 1.0, 0.4, 0.1, 0.0]
    target_mean = 0.5
    expected_coefficient = 0.7491921789832345
    @test fit_profile(profile_values, target_mean) ≈ expected_coefficient atol = 1e-3

    # Test case 2: Using optimization method
    target_mean = 1.0
    expected_coefficient = 0.0
    @test fit_profile(profile_values, target_mean) ≈ expected_coefficient atol = 1e-3
end

@testset "TulipaProfileFitting" begin
    @testset "fit_profile" begin
        test_fit_profile()
    end
end
