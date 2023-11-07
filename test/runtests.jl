using TulipaProfileFitting
using Test

function test_fit_profile()

    # Test case 1: Using root finding method
    profile_values = [1.0, 2.0, 3.0, 4.0, 5.0]
    target_mean = 2.5
    expected_coefficient = 0.8484316283281429
    @test fit_profile(profile_values, target_mean) ≈ expected_coefficient atol = 1e-3

    # Test case 2: Using optimization method
    target_mean = 3.5
    expected_coefficient = 1.1252910585826847
    @test fit_profile(profile_values, target_mean) ≈ expected_coefficient atol = 1e-3
end

@testset "TulipaProfileFitting" begin
    @testset "fit_profile" begin
        test_fit_profile()
    end
end
