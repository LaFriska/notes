#set text(size: 13pt)

#heading([Binary Variables])
\
*Definition.* If $x$ is a random variable and $x in {0,1}$ then $x$ is a binary variable. 

*Definition.* Let $P(x=1) = mu$. Then the #emph([Bernoulli]) distribution is given by
$
"Bern"(x|mu) = mu^x (1-mu)^(1-x). 
$
Let $cal(D)=x_1,...,x_N$, then 
$
p(cal(D)|mu) = product_(n=1)^N p(x_n|mu)
$
which forms the likelihood function for $p(mu|cal(D))$. Then, 
$
ln p(cal(D)|mu) = (ln mu - (ln (1 - mu))) (sum_(n=1)^N x_n) + N ln (1-mu).
$
Since the above function depends on $cal(D)$ only through the sum, $sum_(n=1)^N x_n$ is called a #emph([sufficient statistic]). Maximising the log will result in the sample mean as follows
$
mu_"ML" = 1/N sum_(n=1)^N x_n. 
$
If there is a $mu$ chance of a binary variable being $1$, then we can use a binomial distribution to compute the probability of drawing $m$ instances of $1$ out of a data set of $N$ elements. 

*Definition.* Given a size $N$ and $m$, and a mean $mu$, the #emph([binomial distribution]) is defined as follows 
$
"Bin"(m|N, mu) = vec(N,m)mu^m (1-mu)^(N-m)
$\
where
$
vec(N,m) = (N!)/(m!(N-m)!). 
$
For the binomial distribution, we have the following properties 
$
EE[m] &= N mu\
"var"[m] &= N mu (1-mu).
$