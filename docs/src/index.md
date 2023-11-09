```@meta
CurrentModule = TulipaProfileFitting
```

# TulipaProfileFitting

Documentation for [TulipaProfileFitting](https://github.com/TulipaEnergy/TulipaProfileFitting.jl).

This package fits renewable time series profiles from historical data to future target full load hours. It tries first to fit the curve by finding the roots of a nonlinear equation (``f(x)=0``). If it fails, then it applies a nonlinear programming (``NLP``) optimization model to find the coefficient. The formulation for both methods is described in the mathematical formulation section.

## Contents

```@contents
```
