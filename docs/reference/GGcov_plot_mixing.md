# Plot the Mixing Distribution of a Fitted Gamma-Gamma Model

Plots the gamma mixing distribution of nu0 implied by a fitted model:
shape q (mixture shape) and rate gamma (mixture rate). The mean (dashed)
and median (dotted) are marked with vertical lines and shown in a second
title.

## Usage

``` r
GGcov_plot_mixing(
  fit,
  coverage = 0.999,
  n = 400,
  xlab = expression(nu[0]),
  ylab = "Density",
  main = "Mixing distribution",
  ...
)
```

## Arguments

- fit:

  A fitted model of class `"GGcov"` from
  [`GGcov_MLE`](https://kaloklee.github.io/GGcov/reference/GGcov_MLE.md).

- coverage:

  Central probability mass of the mixing distribution to show on the
  x-axis. Default 0.999.

- n:

  Number of points used to draw the curve. Default 400.

- xlab, ylab, main:

  Axis labels and title.

- ...:

  Further arguments passed to
  [`curve`](https://rdrr.io/r/graphics/curve.html).

## Value

Invisibly returns a list with the `mean` (q / gamma) and `median` of the
mixing distribution.

## Details

With covariates in the model, nu0 is the rate for a subject whose
covariates are all 0 on the original scale (the fitted coefficients are
on the original scale), so the plotted distribution describes that
baseline.
