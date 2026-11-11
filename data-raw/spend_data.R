# data-raw/spend_data.R
#
# Simulates the example datasets shipped with GammaGammaCov: `spend_data` (1000
# customers) and `spend_data_sample` (a random subset of 300 customers).
# Run from the package root:  source("data-raw/spend_data.R")

set.seed(2026)

# ---- True parameters (documented in R/data.R) ----------------------------------
p     <- 2      # within-customer shape
q     <- 8      # mixture shape
gamma <- 200    # mixture rate
beta  <- c(discount = -0.8,      # per unit of discount (0 to 1)
           gendermale = -0.3,    # male vs. female
           channelweb = 0.3,     # web vs. store
           channelapp = -0.4)    # app vs. store

# ---- Simulate ------------------------------------------------------------------
n  <- 1000
x  <- pmin(rgeom(n, 0.35) + 1, 25)               # transactions per customer
Id <- rep(seq_len(n), x)
N  <- length(Id)

# Time-varying: discount applied to each transaction (between 0 and 1)
discount <- round(rbeta(N, 1.5, 5), 2)

# Static factors: drawn once per customer, repeated on each of its rows
gender  <- factor(rep(sample(c("female", "male"), n, replace = TRUE,
                             prob = c(0.55, 0.45)), x),
                  levels = c("female", "male"))
channel <- factor(rep(sample(c("store", "web", "app"), n, replace = TRUE,
                             prob = c(0.5, 0.3, 0.2)), x),
                  levels = c("store", "web", "app"))

W <- cbind(discount,
           gendermale = as.numeric(gender == "male"),
           channelweb = as.numeric(channel == "web"),
           channelapp = as.numeric(channel == "app"))
eta <- c(W %*% beta)                                    # w_j beta'
nu0 <- rgamma(n, shape = q, rate = gamma)               # one nu0 per customer
Price <- rgamma(N, shape = p, rate = nu0[Id] * exp(-eta))
Price <- pmax(round(Price, 2), 0.01)                    # cents, strictly positive

spend_data <- data.frame(Id, Price, discount, gender, channel)

# ---- Small sample for fast examples --------------------------------------------
keep <- sample(unique(spend_data$Id), 300)
spend_data_sample <- spend_data[spend_data$Id %in% keep, ]
rownames(spend_data_sample) <- NULL

# ---- Save ----------------------------------------------------------------------
usethis::use_data(spend_data, spend_data_sample, overwrite = TRUE)
