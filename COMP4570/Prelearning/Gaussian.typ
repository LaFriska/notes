#set text(size: 13pt)

#heading([Gaussian Distribution])
\
The Gaussian distribution is one of the most important probability distributions. It is also refered to as the Normal distribution. 

*Definition.* Given a #emph([mean]) $mu$, a #emph([standard deviation]) $sigma$ whose square is called the #emph([variance]), the #emph([Gaussian distribution]) is given by 
$
cal(N)(x|mu, sigma^2) = 1/sqrt(2 pi sigma^2) exp(-1/(2 sigma^2) (x-mu)^2). 
$
We also call the $beta = 1/sigma^2$ the #emph([precision]). 

*Properties of Gaussian distribution.*
$
EE[x] &= mu\
EE[x^2] &= mu^2 + sigma^2 \
"var"[x] &= sigma^2.
$
*Definition.* The maximum of a Gaussian distribution is called the #emph([mode]). 

#let bx = $bold(x)$
#let bmu = $bold(mu)$
#let bsig = $bold(Sigma)$

*Definition.* Let $bx, bmu in RR^D$ and $bsig$ be an invertible $D times D$ matrix. Then, the $D$-dimensional Gaussian distribution is given by 
$
cal(N)(bx, bmu, bsig) = 1/((2 pi)^(D\/2) sqrt(det bsig)) exp(-1/2 (bx - bmu)^T bsig^(-1) (bx - bmu))
$
*Definition*. Data points drawn independently from the same distribution is called #emph([independent and identically distributed]), abbreviated to #emph([i.i.d]).

Drawing $N$ observations $bx = {x_1, ..., x_N}$  from a Gaussian distribution of unknown mean and standard deviation is an i.i.d. Since we have the property $P(X, Y) = P(X) P(Y)$ for independent variables, it follows that for a given $mu$ and $sigma$,
$
p(bx|mu, sigma^2) = product_(n=1)^N cal(N)(x_n|mu, sigma^2). 
$
We can then maximise the log of the formula above and get the #emph([sample mean]) $mu_"ML"$ as the maximal mean which turns out to just be the average of every value in $bx$. We also get the #emph([sample variance]) by maximising $sigma^2$, and it turns out 
$
sigma^2_"ML" = 1/(N-1) sum_(n=1)^N (x_n - mu_"ML"). 
$
There are limitations in maximal likelihood, as the above approach systematically underestimates the variance, which is a phenomena called #emph([bias]). We first think of $mu_"ML"$ and $sigma^2_"ML"$ as functions of $x_1,...,x_n$. Then, taking $mu$ and $sigma^2$ as the actual parameters from the Gaussian distribution that generated the data points,
$
EE[mu_"ML"] = mu, EE[sigma^2_"ML"] = (N-1)/N sigma^2. 
$
Hence the variance is underestimated with a factor, which becomes nonexistent as $N$ approaches infinity. 

