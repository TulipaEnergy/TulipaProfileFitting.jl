# Mathematical Formulation

This section shows the mathematical formulation of the nonlinear programming (NLP) optimization model used in this package.

```math
\begin{align}
\displaystyle {\min_{x} {\left(\sum_{h}P_{h}^{x} - FLH\right)}^{2}}
\end{align}
```

$s.t.$

```math
\begin{align}
x \geq 0
\end{align}
```

Where:

$x$: decision variable to scale the hourly values of the profile

$P_{h}$: profile value at hour $h$

$FLH$: target full load hours

The objective function minimizes the squared error to the target full load hours, while constraint ensures the new coefficient is positive.
