# Simulated Customer Spend Data

Simulated transaction-level data with covariates, generated from the
gamma-gamma model fitted by
[`GGcov_MLE`](https://kaloklee.github.io/GammaGammaCov/reference/GGcov_MLE.md).
The data mimic the structure of retail transaction logs with covariates,
such as the apparel example in the CLVTools vignette (Bachmann et al.,
2025). `spend_data` holds 1000 customers; `spend_data_sample` is a
random subset of 300 customers for quick examples.

## Usage

``` r
spend_data

spend_data_sample
```

## Format

A data frame with one row per transaction and 5 variables:

- Id:

  Customer identifier.

- Price:

  Amount spent in the transaction (strictly positive).

- discount:

  Time-varying numeric covariate: the discount applied to the
  transaction, between 0 and 1.

- gender:

  Time-invariant factor with 2 levels (`"female"`, `"male"`), repeated
  on each of the customer's rows. The first level is the reference.

- channel:

  Time-invariant factor with 3 levels (`"store"`, `"web"`, `"app"`),
  repeated on each of the customer's rows. The first level is the
  reference.

An object of class `data.frame` with 858 rows and 5 columns.

## Source

Simulated; see `data-raw/spend_data.R`.

## Details

Each row is one transaction. The true parameters used to generate the
data are p = 2 (within-customer shape), q = 8 (mixture shape), gamma =
200 (mixture rate), and coefficients -0.8 (`discount`, per unit), -0.3
(`gender` male versus female), 0.3 (`channel` web versus store) and -0.4
(`channel` app versus store).

## References

Bachmann, P., Kuebler, N., Meierer, M., Naef, J., Oblander, E., &
Schilter, P. (2025). CLVTools: Tools for Customer Lifetime Value
Estimation. R package version 0.12.1.
<https://github.com/bachmannpatrick/clvtools>

## Examples

``` r
head(spend_data)
#>   Id Price discount gender channel
#> 1  1 14.93     0.31   male   store
#> 2  1 21.12     0.01   male   store
#> 3  2 23.43     0.49 female     web
#> 4  2 50.20     0.43 female     web
#> 5  2 17.34     0.48 female     web
#> 6  3 25.85     0.06 female     web
```
