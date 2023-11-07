# Mathematical Formulation

## Finding the coefficient by solving ``f(x)=0``

This section shows the nonlinear equation used in this package to obtain the coefficient that fits the profile values to the target full load hours.

```math
\begin{align}
\displaystyle {\sum_{h}P_{h}^{x} - FLH = 0}
\end{align}
```

Where:

$x$: coefficient to fit the hourly values of the profile

$P_{h}$: profile value at hour $h$

$FLH$: target full load hours

```math
\begin{align}
\displaystyle {FLH = total\_number\_of\_hours \cdot target\_mean}
\end{align}
```

## Finding the coefficient by solving an ``NLP``

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

The objective function minimizes the squared error to the target full load hours, while constraint ensures the new coefficient is positive.
