# Internal Optimization for the Equation (6) Model

BFGS on the log scale for p, q and gamma, so an unconstrained method is
appropriate.

## Usage

``` r
GGcov_optim(model_data)
```

## Arguments

- model_data:

  Data frame prepared by `GGcov_MLE`: id, z, then the standardized
  covariate columns.

## Value

The unmodified list returned by
[`optim`](https://rdrr.io/r/stats/optim.html) (internal scale: log p,
log q, log gamma, standardized coefficients), including the Hessian of
the negative log-likelihood.
