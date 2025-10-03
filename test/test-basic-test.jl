@testset "Test fit profile" begin
    # Test case 1: Increasing the current mean value
    profile_values = [0.2, 0.5, 0.9, 1.0, 0.4, 0.1, 0.0]
    target_mean = 0.5
    expected_coefficient = 0.7491921797062476
    @test find_solution(profile_values, target_mean) ≈ expected_coefficient atol = 1e-3

    # Test case 2: Decreasing the current mean value
    target_mean = 0.4
    expected_coefficient = 1.2550552057968192
    @test find_solution(profile_values, target_mean) ≈ expected_coefficient atol = 1e-3

    # Test case 3: target mean μ < n/m
    target_mean = 0.1
    expected_coefficient = 1000.0
    @test find_solution(profile_values, target_mean) ≈ expected_coefficient atol = 1e-3

    # Test case 4: target mean μ > r/m
    target_mean = 0.9
    expected_coefficient = 0.0
    @test find_solution(profile_values, target_mean) ≈ expected_coefficient atol = 1e-3
end

@testset "Test throws error" begin
    profile_values = [-0.5, 0.2, 0.8, 1.5]
    target_mean = 0.5
    @test_throws ErrorException find_solution(profile_values, target_mean)
end
