#set text(size: 13pt)

#heading([Probability Theory])
\
Let $X$ be a random variable with possible values $x_1,...,x_M$ and $Y$ with $y_1,...,y_L$. Then we denote the probability of $X = x_i$ by $P(X = x_i)$ which is abbreviated to $P(x_i)$. Then, $P(x|y)$ denotes the probability of $x$ given $y$ is true.\
\
*Sum Rule*.
$
P(X) = sum_Y P(X,Y)
$
*Product Rule.*
$
P(X, Y) = P(Y|X)P(X)
$
*Corollary*. 
$
P(X) = sum_Y P(Y|X)P(X)
$
*Definition.* $X$ and $Y$ are said to be #emph([independent]) if $P(X,Y)=P(X)P(Y).$

*Bayes' Theorem*.
$
P(X|Y) = (P(Y|X)P(X))/(P(Y))
$
In the above equation, $X$ is a hypothesis and $Y$ is the evidence we know is true. We want to know what is the probability of the hypothesis given the evidence. Here, $P(X)$ is the #emph([prior]), which tells us the probability of $X$ happening before we observed the evidence, then $P(Y|X)$ is the #emph([likelihood]), the chance of the evidence given the hypothesis. $1\/P(Y)$ is the scaling factor to ensure the probability is normalised. Finally, $P(X|Y)$ is called the #emph([posterior]).

#heading([Probability Densities])
\
Now we move to continuous probabilities.\

*Definition*. Suppose $x$ is a real-valued random variable. If the probability of $x$ falling in the interval $(x, x+delta x)$ is $p(x) delta x$ as $delta x$ approaches $0$, then $p(x)$ is the #emph([probability density]) over $x$ if the two of the following conditions hold:

1. $p(x)>= 0$ for all $x in RR$.

2. $integral_(-oo)^(oo) p(x) d x = 1$. 
\

Trivially, we have
$
P(x in (a,b)) = integral_a^b p(x) d x
$
and we define the cumulative distribution function given by 
$
P(z) = integral_(-oo)^z p(x) d x,
$
which satisfies $P'(x) = p(x)$. We can also have multivariable probability densities over $RR^D$, where we just integrate over $RR^D$ instead of $RR$. 

*Continuous Sum Rule*.
$
p(x) = integral p(x, y) d y
$
Product rule is the exact same formula as the discrete version.

#heading([Expectation and Covariance])
\
*Definition.* Let $X$ be a random variable and $f:X --> RR$, and let $p(x)$ be a probability distribution over $X$. Then, the #emph([expectation]) of $f$ is given by 
$
EE[f] = sum_(x in X) p(x) f(x)
$
if $X$ is discrete, and 
$
EE[f] = integral_X p(x) f(x) d x 
$
if continuous. 

The intuition is to compute the average of $f$ but weighing each value by its probability. Note that if we consider functions to be vectors, then $EE[dot]$ is a linear map. 

We can also approximate $EE[f] approx 1/N sum_(n=1)^N f(x_n)$ where ${x_1,...,x_N}$ is $N$ samples drawn from $X$.  If we take the limit as $N$ approaches infinity then the approximation becomes an equivalence. 

*Definition.* The #emph([variance]) of $f$ is defined as follows
$
"var"[f] = EE[(f-EE[f])^2]
$
Using the linearity of $EE$ its trivial to show that 
$
"var"[f] = EE[f^2]-EE[f]^2. 
$
*Definition.* For two random variables $x$ and $y$, the #emph([covariance]) is defined as follows 
$
"cov"[x,y] = EE_(x,y)[(x-EE[x])(y-EE[y])] = EE[x y] - EE[x] EE[y]. 
$
*Notation*. $"cov"[x] := "cov"[x,x]$. 

