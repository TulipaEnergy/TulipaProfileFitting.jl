export find_solution, find_search_interval

"""
(a, b) = find_search_interval(f)

Returns an interval such that ``f(a) × f(b) ≯ 0``.
It could be 0 for either endpoint, but it is not positive,
ensuring that there is a root in `[a, b]`.
"""
function find_search_interval(f)
    a = 0.0
    b = 1.0
    fa, fb = f(a), f(b)
    while fa * fb > 0
        δ = b - a
        a, fa = b, fb
        b += 2δ
        fb = f(b)
    end
    return a, b
end

"""
x = find_solution(P, μ)

Finds a points such that ``S(x) = μ``, if possible, where

```math
S(x) = \\frac{1}{|P|} \\sum_{p ∈ P:\\ p > 0} p^x.
```

If not possible, return either 0 or 1000, depending on what is most appropriate.
"""
function find_solution(P, μ)
    σ(P, x) = P > 0 ? P^x : 0.0
    S(P, x) = mean(σ.(P, x))
    m = length(P)
    r = count(P .> 0)
    n = count(P .== 1)
    if μ > r / m
        return 0.0
    elseif μ > n / m
        a, b = find_search_interval(x -> S(P, x) - μ)
        return Roots.find_zero(x -> S(P, x) - μ, (a, b))
    else
        return 1000.0
    end
end
