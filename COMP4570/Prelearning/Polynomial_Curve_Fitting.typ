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
E_("RMS")(bold(w)) = sqrt(1/N E(bold(w)))
$
