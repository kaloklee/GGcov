# Fit the Equation (6) Model by Maximum Likelihood

Fits the model in which, for each subject, the outcomes z_1, ..., z_x
are gamma distributed with shape p and rate nu0 \* exp(-w_i beta'), and
nu0 has a gamma(q, gamma) distribution that is integrated out (equation
6). Covariates are centered and scaled internally for numerical
stability, and the results are converted back to the original covariate
scale.

## Usage

``` r
GGcov_MLE(fo, data, subject, level = 0.95)
```

## Arguments

- fo:

  Formula `z ~ w1 + w2 + ...`: the outcome on the left, plain covariate
  names on the right. Transformations such as `log(x)` or `I(x^2)` and
  interactions are rejected with an error; create transformed variables
  as new columns in `data` first. Do not include an intercept: gamma
  plays that role. Use `z ~ 1` to fit the null model with no covariates
  (p, q and gamma only); it is nested in any model with covariates (all
  coefficients equal to 0), so `2 * (null$value - full$value)` is a
  likelihood-ratio statistic with one degree of freedom per coefficient.

- data:

  Data frame in long format, one row per subject per period. Row order
  does not matter. Covariates may be time-varying or static: a static
  covariate is handled by repeating its value on each of the subject's
  rows.

- subject:

  Character string naming the subject ID column in `data`.

- level:

  Confidence level for the Wald intervals, strictly between 0 and 1.
  Default 0.95.

## Value

A list of class `"GGcov"` containing the `optim` results with additional
elements. All estimates, standard errors and bounds are on the original
covariate scale (only `hessian` is on the internal parameterization):

- par:

  Estimates: p (shape), q (mixture shape: the shape of the gamma mixing
  distribution of nu0), gamma (mixture rate: its rate), then the
  covariate coefficients.

- par_stderr:

  Standard errors. For p, q and gamma these use the delta method, e.g.
  SE(p) is approximately p \* SE(log p). `NA` with a warning if the
  Hessian is not positive definite.

- par_lower, par_upper:

  Wald limits at `level`. For p, q and gamma the interval is built on
  the log scale and exponentiated.

- level:

  The confidence level used.

- value:

  Negative log-likelihood at the optimum.

- convergence:

  optim convergence code (0 = success; any other code triggers a
  warning).

- hessian:

  Hessian on the internal parameterization (log p, log q, log gamma,
  standardized coefficients).

- center, scale:

  Covariate means and standard deviations used internally.

- terms, xlevels:

  Covariate terms and factor levels, for coding new data.

- spend_name, subject_name:

  Names of the outcome and subject columns used in the fit, so
  [`GGcov_expected_spend`](https://kaloklee.github.io/GGcov/reference/GGcov_expected_spend.md)
  can find them in new data.
