# Print a Fitted Equation (6) Model

Print a Fitted Equation (6) Model

## Usage

``` r
# S3 method for class 'GGcov'
print(x, digits = 4, ...)
```

## Arguments

- x:

  A fitted model of class `"GGcov"` from
  [`GGcov_MLE`](https://kaloklee.github.io/GammaGammaCov/reference/GGcov_MLE.md).

- digits:

  Number of significant digits to print. Default 4.

- ...:

  Unused.

## Value

`x`, invisibly.

## Examples

``` r
fit <- GGcov_MLE(Price ~ 1, data = spend_data_sample, subject = "Id")
print(fit, digits = 3)
#> Gamma-gamma model 
#> 
#>                      Estimate Std. Error Lower 95% Upper 95%
#> p (shape)                1.90     0.0985      1.72      2.10
#> q (mixture shape)        5.63     0.9560      4.04      7.85
#> gamma (mixture rate)   106.00    22.5000     69.90    161.00
#> 
#> Negative log-likelihood: 4017.563
#> Convergence code: 0
```
