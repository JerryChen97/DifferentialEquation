# DifferentialEquation
This is a repo for the homework 2 of computational physics

## Introduction
In this module we will make use of finite difference method to solve the scalar wave equation in 1+1 dimensions:

$$ \partial_t^2 u + c^2 \partial_x^2 u = 0$$

with default boundary conditions
$$ u(0, t) = u(1, t) = 0 $$
and initial conditions 
$$ u(x, 0) = f(x) $$

## Algorithm

This is a classical problem, and there are many different methods to approach the correct solution.

Here we choose the finite difference method as our primary choice since it is easiest to implement and most straightforward to understand.


### Finite Difference

By finite difference method, we can express the derivatives as the difference between lattice points, which are discretized by $\Delta x$:

$$ f''(x_n) = \frac{f(x_{n-1})+f(x_{n+1})-2f(x_n)}{\Delta x^2} $$

so here for our wave equation we have

$$ \frac{u(x_i, t_{n+1})-2 u(x_i, t_{n})+u(x_i, t_{n-1})}{\Delta t^{2}}=c^{2} \frac{u(x_{i+1}, t_{n})-2 u(x_i, t_{n})+u(x_{i-1}, t_{n})}{\Delta x^{2}} $$

where we denote the time indices by n and space indices by i.

Therefore, we can derive that the update rule for our states $u_i^n$

$$ u(x_i, t_{n+1})=-u(x_i, t_{n-1})+2 u(x_i, t_{n})+{c \frac{\Delta t}{\Delta x}}^{2}\left(u(x_{i+1}, t_{n})-2 u(x_i, t_{n})+u(x_{i-1}, t_{n})\right) $$

If we denote $r:=c \frac{\Delta t}{\Delta x}$, then we can sort the formula above as 
$$ u(x_i, t_{n})={r}^{2}u(x_{i+1}, t_{n-1})+2(1-r^2) u(x_i, t_{n-1})+{r}^{2} u(x_{i-1}, t_{n-1}) -u_{i}^{n-2}. $$

Meanwhile, the initial condition shows that
$$
u(x_{i}, t_{2}) = \frac{1}{2}\left(r^2 u(x_{i+1}, t_{1}) + 2(1-r^2)u(x_{i}, t_{1}) + r^2 u(x_{i-1}, t_{1})\right) + g(x_i) \Delta t.
$$
