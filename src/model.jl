export fit_profile

"""
    fit_profile(profile_values::Vector{Float64},
                target_mean::Float64)

Fits a profile to a target mean using either root finding or optimization.

# Arguments

  - `profile_values::Vector{Float64}`: A vector of profile values.
  - `target_mean::Float64`: The target mean to fit the profile to.

# Returns

  - `coefficient::Float64`: The coefficient that fits the profile to the target mean.
"""
function fit_profile(profile_values::Vector{Float64}, target_mean::Float64)
    try
        # Find the coefficient using the root finding method
        coefficient = find_zero(x -> sum(profile_values .^ x .- target_mean), [1e-3, 1.0])
        return coefficient
    catch e
        @warn "find_zero failed with error: $e. Using optimization instead."

        total_hours = length(profile_values)

        model = Model(() -> AmplNLWriter.Optimizer(Bonmin_jll.amplexe))
        @variable(model, x >= 0)
        @NLobjective(
            model,
            Min,
            (
                sum((profile_values[i])^x for i = 1:total_hours) -
                target_mean * total_hours
            )^2
        )

        optimize!(model)
        coefficient = value.(x)
        return coefficient
    end
end
