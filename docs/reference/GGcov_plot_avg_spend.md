# Plot Observed versus Fitted Average Spend

Compares the observed distribution of each customer's average spend per
transaction, \\\bar{z}\\, with the distribution implied by a fitted
gamma-gamma model, as in Figure 3 of Fader and Hardie (2013).

## Usage

``` r
GGcov_plot_avg_spend(
  fit,
  data,
  max_customers = 5000,
  n = 400,
  xlab = "Average spend per transaction",
  ylab = "Density",
  main = "Observed versus fitted average spend"
)
```

## Arguments

- fit:

  A fitted model of class `"GGcov"` from
  [`GGcov_MLE`](https://kaloklee.github.io/GammaGammaCov/reference/GGcov_MLE.md).

- data:

  The transaction data frame used to fit the model (subject, spend and
  covariate columns).

- max_customers:

  Maximum number of customers used to draw the fitted curve. If there
  are more customers, a random subset is used for the curve (the
  observed density always uses all customers).

- n:

  Number of points used to draw the curves.

- xlab, ylab, main:

  Axis labels and main title.

## Value

Invisibly, a list with the plotted `grid`, the `observed` and `fitted`
densities, the number of customers (`n_customers`) and the number whose
covariates vary over time (`n_time_varying`).

## Details

For a customer with \\x\\ transactions, the fitted density of
\\\bar{z}\\ is the average over customers of \$\$f(\bar{z}) =
\frac{1}{c} \\ \frac{\Gamma(k + q)}{\Gamma(k)\Gamma(q)} \\
\frac{\gamma^q (\bar{z}/c)^{k-1}}{(\gamma + \bar{z}/c)^{k+q}},\$\$ where
\\a_1 = \sum_j e^{w_j\beta'}\\, \\a_2 = \sum_j e^{2 w_j\beta'}\\, \\k =
p a_1^2 / a_2\\ and \\c = a_2 / (x a_1)\\.

- If the customer's covariate effect is the same on every transaction
  (no covariates, or static covariates), then \\k = p x\\ and the
  density is exact.

- If the covariates change across a customer's transactions, the total
  spend is a sum of gamma variables with different rates, which has no
  closed form. The total is then approximated by a gamma distribution
  with the same mean and variance (given \\\nu_0\\), the
  Satterthwaite-Welch approximation, which gives the expression above.
  The plot says so when this approximation is used.

## References

Fader, P. S., & Hardie, B. G. S. (2013). *The Gamma-Gamma Model of
Monetary Value* (Research Note No. 025).
<https://brucehardie.com/notes/025/>

Satterthwaite, F. E. (1946). An approximate distribution of estimates of
variance components. *Biometrics Bulletin*, 2(6), 110-114.

Welch, B. L. (1947). The generalization of "Student's" problem when
several different population variances are involved. *Biometrika*,
34(1/2), 28-35.

Moschopoulos, P. G. (1985). The distribution of the sum of independent
gamma random variables. *Annals of the Institute of Statistical
Mathematics*, 37, 541-544.
