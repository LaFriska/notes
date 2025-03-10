#set text(size: 13pt)

= Linear Regression
\

=== Training Data 

We have $N$ input, output pairs $cal(D)={(bold(x)_1, y_1),...,(bold(x)_N, y_N)}$ where $bold(x)_n in RR^D$ where $D$ is the dimension and $y_n in RR$.

Hence we can write $cal(D)$ as a matrix. 

#set math.mat(delim: "[")

$
bold(X) = mat(
  x_11,x_12,...,x_(1 D);
  x_21,x_22,...,x_(2 D);
  dots.v, dots.v, dots.down, dots.v;
  x_(N 1),x_(N 2),...,x_(N D);
) space space space bold(y) = mat(y_1;y_2;dots.v;y_N). 
$
Each row $i$ is the data point $bold(x)_i$ and each column is refered to as a feature dimension. 

*Assumptions*

Underlying function $f$ is linear, so that 
$
f_theta (bold(x)) = theta^T bold(x), "where" theta^T in RR^D. 
$
Observation $y$ is a noisy version of $f$.
$
f_theta (bold(x)_i) approx y 
$

*What we need*

We want to prove that $theta^T$ is a good approximation for $bold(y)$. 

*Linear Regression*

Linear regression means linear in the parameters, not in the input data. 

== Objective Function 

In this case, our objective function is the error function we want to minimise. We use the #emph([L2 loss function]). 
$
L(theta) = 1/N sum_(i=1)^N (y_i - f_theta (bold(x)_i))^2 = sum_(i=1)^N (y_i - theta^T bold(x)_i).
$
It is easy to check that 
$
L(theta) = 1/N (bold(y)-X theta)^T (bold(y)-X theta). 
$

== Minimal Solution 


We now prove that the minimal solution of $L$ is $(X^T X)^(-1) X^T bold(y)$. We first derive $L$ with respect to $theta$. 
$
L(theta) = 1/N||bold(y)-X theta||^2
$
Then, using chain rule,
$
partial/(partial theta) L(theta) &= 2/N (bold(y)-X theta) dot (-X)\
&= (-2)/N X^T (bold(y)-X theta)\
$
Then, setting it to $0$,\
$
(-2)/N X^T (bold(y)-X theta) &= 0\
=> X^T (bold(y)-X theta) &= 0\
=> X^T bold(y) - X^T X theta &= 0\
=> theta &= (X^T X)^(-1) X^T bold(y). 
$
== With Features 

To provide more flexibility to the model, we may apply a nonlinear transformation on the data. (We only require the objective function to be linear in the parameters $theta$.)
Hence, we define a matrix
$
Phi(bold(x)) = mat(
  phi.alt_1 (x_1), phi.alt_2 (x_1), ..., phi.alt_D (x_1);
  phi.alt_1 (x_2), phi.alt_2 (x_2), ..., phi.alt_D (x_2);
  dots.v, dots.v, dots.down, dots.v;
  phi.alt_1 (x_N), phi.alt_2 (x_N), ..., phi.alt_D (x_N);
)
$
where each $phi.alt$ defines a feature function. One example of this is $phi.alt_i = x^(i-1)$. 

Then if we define $f_theta (x) = theta Phi(bold(x))$ then we have the closed-form solution $(Phi^T Phi)^(-1) Phi^T bold(y)$.

== Regularisation

The idea is to penalise the error function for having larger amplitude solutions. 

$
L_lambda (theta) = L(theta) + lambda||theta||_p^p 
$
== Hyperparameters
Examples of hyperparameters include 
- Degree of polynomial regression
- Number of kernels in kernel methods 
- Regularisation parameter 

