export fit_profile

"""
    fit_profile(profile_values::Vector{Float64},
                target_mean::Float64)

This function takes a vector of profile values and the total hours in the year.
It fits the profile values to the mean value of the profile and the total hours
in the year. It returns the optimization model and the coefficient of the scaling.
"""
function fit_profile(profile_values::Vector{Float64},
                     target_mean::Float64)

    total_hours = length(profile_values)

    # Create a model
    model = Model(() -> AmplNLWriter.Optimizer(Bonmin_jll.amplexe))

    # Create a variable for the whole year
    @variable(model, x >= 0)

    # Create the objective function
    @NLobjective(model, Min, (sum((profile_values[i])^x for i in 1:total_hours) - target_mean*total_hours)^2)

    # Solve the model
    optimize!(model)

    # Get the solution
    coefficient = value.(x)

    # Return the coefficient
    return coefficient

end

