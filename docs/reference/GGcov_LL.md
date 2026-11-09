# Negative Log-Likelihood for Equation (6)

Negative Log-Likelihood for Equation (6)

## Usage

``` r
GGcov_LL(par, data_df)
```

## Arguments

- par:

  c(log p, log q, log gamma, beta), optimizer scale.

- data_df:

  Data frame: column 1 = id, column 2 = z (outcome, \> 0), columns 3+ =
  covariates W (none for the null model, in which case `par` is just
  c(log p, log q, log gamma)). One row per subject per period.

## Value

Scalar negative log-likelihood.
