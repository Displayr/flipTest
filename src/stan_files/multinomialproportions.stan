data{
  /* Number of groups (categories) */
  int<lower=1> groups;
  /* observed counts */
  int counts[groups]; 
  /* dirichlet prior*/
  vector<lower=0>[groups] alpha;
}

parameters{
    simplex[groups] theta;
}

model{
    theta ~ dirichlet(alpha);
    counts ~ multinomial(theta);
}

generated quantities {
  real mx;
  real preferred[groups];
  mx = max(theta);
  for (g in 1:groups)
      preferred[g] = theta[g] == mx ? 1.0 : 0.0;
}
