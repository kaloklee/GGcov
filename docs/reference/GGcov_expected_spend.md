# Expected Spend per Transaction

Computes the expected spend on future transactions from a fitted
gamma-gamma model, given each customer's observed history. For a
customer with x past transactions (spends z_1, ..., z_x and covariates
w_1, ..., w_x) and a future transaction with covariates w_k, the
expected spend is

## Usage

``` r
GGcov_expected_spend(fit, newdata, history = NULL)
```

## Arguments

- fit:

  A fitted model of class `"GGcov"` from
  [`GGcov_MLE`](https://kaloklee.github.io/GGcov/reference/GGcov_MLE.md).

- newdata:

  Data frame with one row per future transaction to predict: the subject
  column and the covariates (original, unstandardized values; factors
  are coded as in the fit) in effect for that transaction.

- history:

  Optional data frame of observed transactions, with the subject column,
  the spend column and the covariates, laid out like the data used for
  [`GGcov_MLE`](https://kaloklee.github.io/GGcov/reference/GGcov_MLE.md).
  If `NULL`, every customer is treated as having no past transactions.

## Value

A data frame with one row per row of `newdata`: the subject identifier,
`n_trans` (number of past transactions used) and `expected_spend`.
Entries are `NA` where the formula requires a condition that fails (\\p
x + q \le 1\\).

## Details

\$\$E(Z_k \mid \cdot) = \frac{p \\ (\gamma + B(x))}{p x + q - 1} e^{w_k
\beta'}, \qquad B(x) = \sum\_{i=1}^{x} z_i e^{-w_i \beta'},\$\$

which requires \\p x + q \> 1\\ (Fader and Hardie, 2024). One formula
covers all cases:

- time-varying covariates: each past and future transaction has its own
  covariate values;

- static covariates: repeat each customer's values on every row, and
  B(x) reduces to the total spend times \\e^{-w\beta'}\\;

- no past transactions (x = 0, or a customer absent from `history`):
  B(x) = 0, giving the prior expectation \\p \gamma e^{w_k\beta'} / (q -
  1)\\, which requires q \> 1;

- a model without covariates: \\e^{w_k\beta'} = 1\\.

## References

Fader, P. S., & Hardie, B. G. S. (2024). *Incorporating Covariates in
the Gamma-Gamma Spend Model* (Research Note No. 045).
<https://brucehardie.com/notes/045/>
