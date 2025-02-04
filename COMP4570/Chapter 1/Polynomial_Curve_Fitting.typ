#set text(size: 13pt)

#heading([Polynomial Curve Fitting])
\
We start by solving a simple problem in ML. Suppose we have a #emph([training set]) of $N$ values, that is, a vector $bold(x)={x_1,...,x_N}$ corresponding to $bold(t)={t_1,...,t_N}$. Now given a new value $x$, we want to predict its corresponding value $t$. 

Given a set of coefficients $bold(w)={w_0,...,w_(M)}$ for some $M in NN$, we have a polynomial of degree $M$ expressed as $y(x,bold(w))=sum_(i=0)^M w_i x^i$. Now we want to approximate the relation between $bold(x)$ and $bold(t)$ using a polynomial. We want to minimise an #emph([error function]) that tells us how good the approximation is given coefficients $bold(w)$. The error function evaluates to $0$ if and only if it passes through every $t in bold(t)$. Below is a simple way to do it. 

*Definition.* The #emph([sum of squares]) error function $E$ is given by
$
E(bold(w)) = 1/2 sum_(n=1)^N (y(x_n, bold(w)) - t_n)^2. 
$

#let minw = $bold(w)^*$

Deriving this gives us a linear map with a trivial kernel, so there is a unique $minw$  such that $E(minw)$ is minimal. We still need to choose $M$, if it's too large then we have the problem of over-fitting, if too little, we don't have enough flexibility to fit accurately to the training set. 

We could rigorously test whether over-fitting is a problem by using our function $y(x, minw)$ against a set with way more datapoints. Hence, we require the following definition that generalises $N$.

*Definition.* The #emph([root-means-square]) error function is defined as follows. 

$
E_("RMS")(bold(w)) = sqrt(1/N E(bold(w))). 
$
#heading([Curve Fitting Revisited])
\
(Please read probability theory an fundamentals of Gaussian distribution first.)

#let bt = $bold(t)$
#let bx = $bold(x)$
#let bw = $bold(w)$

We now assume the value we are trying to predict, $t$, has a Gaussian distribution with $mu = y(x, bw)$, and that 
$
p(t|x, bw, beta) = cal(N)(y(x,bw), beta^(-1)). 
$
Recall that $beta = 1/sigma^2$. We assume the datapoints are independent, and we maximise the likelihood function below 
$
p(bt|bx,bw,beta) = product_(n=1)^N cal(N)(t_n|y(x_n, bw), beta^(-1)). 
$
This can be done by maximising its log.

$
ln p(bt|bx,bw,beta) = -beta/2 sum_(n=1)^N (t_n - y(x_n, bw))^2 + N/2 ln beta - N/2 ln 2 pi 
$

If we simplify the process of maximising $bw$ by deleting the addition of the constant terms, then let $beta = 1$, and minimise instead the negative log of $p(bt|bx,bw,beta)$, it follows now that this maximisation process is exactly the minimisation of the sum-of-squares error function. Also note that 

$
1/beta_"ML" = 1/N sum_(n=1)^N (y(x_n, bw_"ML") - t_n)^2. 
$
We may now predict a distribution given a new $(x, t)$. This is called a #emph([predictive distribution]). 

$
p(t|x, bw_"ML", beta_"ML") = cal(N)(t|y(x, bw_"ML"),beta^(-1)_"ML"). 
$
Now we wish to introduce a more Bayesian approach. Given a precision $alpha$, we define a prior. 
$
p(bw|alpha) = cal(N)(bw|bold(0), alpha^(-1) bold(I)) = (alpha/(2pi))^((M+1)/2) exp (- alpha/2 bw^T bw). 
$
A parameter like $alpha$ is called a #emph([hyper-parameter]). The motivation is to define a probability distribution over $RR^(M+1)$ around the origin with a precision $alpha$. Then, by Bayes' theorem,
$
p(bw|bx,bt,alpha, beta) prop p(bt|bx, bw, beta)p(bw|alpha). 
$
We then use #emph([maximum posterior]) or #emph([MAP]) by minimising the negative log. We find that the maximum of the posterior is given by the minimum of the following
$
beta/2 sum_(n=1)^N (y(x_n,bw))^2 + alpha/2 bw^T bw. 
$
So maximising the posterior is to minimise the sum of squares error function with regularisation parameter $lambda = alpha\/beta$. 

For a full Bayesian approach, we repeatedly apply the sum and product rules. Ultimately, we wish to find $p(t|x,bx,bt)$. Hence, we write it in the following form.
$
p(t|x,bx,bt) = integral p(t|x, bw) p(bw|bx,bt) space d bw. 
$
Recall that $p(t|x, bw) = cal(N)(t|y(x, bw),beta^(-1))$. 

We will see that 
$
p(t|x, bx, bt) = cal(N)(t|m(x), s^2(x)). 
$
where the mean and variance are given by 

#let bphi = $bold(phi.alt)$
$
m(x) &= beta bphi(x)^T bold(S) sum_(n=1)^N bphi(x_n) t_n\
s^2(x) &= beta^(-1) + bphi(x)^T bold(S) bphi(x)
$
where 
$
bold(S)^(-1) &= alpha bold(I) + beta sum_(n=1)^N bphi(x_n) bphi(x)^T \
bphi(x) &= (x, x^2, x^3,...,x^M)^T. 
$