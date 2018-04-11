data {
  /* Number of groups (categories) */
  int<lower=1> groups;
  /* Number of trials */
  int trials[groups];
  /* Number of successes */
  int successes[groups];
}

parameters {
  real<lower=0, upper=1> rates[groups];
}

model {
  rates ~ uniform(0, 1);
  for (g in 1:groups)
    successes[g] ~ binomial(trials[g], rates[g]);
}

generated quantities {
  real mx;
  real preferred[groups];
  mx = max(rates);
  for (g in 1:groups)
      preferred[g] = rates[g] == mx ? 1.0 : 0.0;
}
