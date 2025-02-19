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

We now write a useful way of generalising the factorial to non-negative reals.

*Definition.* The #emph([Gamma Distribution]) is given by the following
$
Gamma (x) = integral y^(x-1) e^(-y) space d y
$
It is easy to show that the Gamma distribution possesses the property 
$Gamma(x)=x!$ for any $x in NN$. 

For a Bayesian approach, we need to define a prior for $mu$. Due to various useful properties, we use the following. 

*Definition*. Given hyper-parameters $a$ and $b$, the #emph([Beta Distribution]) is given by the following. 

$
"Beta"(mu|a,b)= (Gamma(a+b))/(Gamma(a)Gamma(b)) mu^(a-1) (1-mu)^(b-1)
$

We define the prior $p(mu)="Beta"(mu|a,b)$.

The Beta distribution has the following properties.
$
integral_0^1 "Beta"(mu|a,b) space d mu &= 1.\
EE[mu] &= a/(a+b)\
"var"[mu] &= (a b)/((a+b)^2 (a+b+1))
$
The posterior can then be deduced by multiplying the beta function with the binomial likelihood, then normalising. 

*Proposition.* Given the parameters $m, l, a, b$, where $l = N-m$, the binomial likelihood and beta prior, we have 
$
p(mu|m,l,a,b) prop mu^(m+a-1) (1-mu)^(l+b-1). 
$
#emph([Proof.]) Recall Baye's theorem. 
$
p(mu|cal(D)) = (p(cal(D)|mu)p(mu))/(p(cal(D)))
$
Hence we have 
$
p(mu|m,l,a,b) prop p(cal(D)|mu) p(mu) &= "Bin"(m|N, mu) "Beta"(mu|a,b).\
&= (N!)/((N-m)!m!) (Gamma(a+b))/(Gamma(a) Gamma(b)) mu^(a-1)(1-mu)^(b-1) mu^m (1-mu)^(N-m)\ 
$
Since $(N!)/((N-m)!m!) (Gamma(a+b))/(Gamma(a) Gamma(b))$ is just a constant, we can delete it. Hence, 
$
p(mu|m,l,a,b) &prop mu^(a-1)(1-mu)^(b-1) mu^m (1-mu)^l\
&prop mu^(m+a-1) (1-mu)^(l+b-1). 
$
$qed$

We can also observe that posterior $p(mu|m,l,a,b)$, when normalised, is just a Beta distribution, since 
$
p(mu|m,l,a,b) = (Gamma(m+a+l+b))/(Gamma(m+a)Gamma(l+b)) mu^(m+a-1)(1-mu)^(l+b+1) = "Beta"(mu|m+a,l+b). 
$
Hence the posterior can act like the prior upon observations of more data. 

Hence we can sequentially train our model by giving it more and more data, and constantly updating the Beta distribution. We now predict as best as we can, the outcome of the next trial, then we use the rules of probability. 
$
p(x=1|cal(D)) = integral_0^1 p(x=1|mu)p(mu|cal(D)) d mu = integral_0^1 mu p(mu|cal(D)) d mu = EE[mu|cal(D)]. 
$
It follows that 
$
p(x=1|cal(D)) = (m+a)/(m+a+l+b). 
$
