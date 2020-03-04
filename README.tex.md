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

$$ u(x_i, t_{n+1})=-u(x_i, t_{n-1})+2 u(x_i, t_{n})+({c \frac{\Delta t}{\Delta x}})^{2}\left(u(x_{i+1}, t_{n})-2 u(x_i, t_{n})+u(x_{i-1}, t_{n})\right) $$

If we denote $r:=c \frac{\Delta t}{\Delta x}$, then we can sort the formula above as 
$$ u(x_i, t_{n})={r}^{2}u(x_{i+1}, t_{n-1})+2(1-r^2) u(x_i, t_{n-1})+{r}^{2} u(x_{i-1}, t_{n-1}) -u(x_{i}, t_{n-2}). $$

Meanwhile, due to the extensibility and uniqueness of the solution of wave equations, the initial condition shows that
$$
u(x_{i}, t_{1}) = \frac{1}{2}\left(r^2 u(x_{i+1}, t_{0}) + 2(1-r^2)u(x_{i}, t_{0}) + r^2 u(x_{i-1}, t_{0})\right) + g(x_i) \Delta t,
$$
and the boundary conditions are 
$$
u(x_0, t_{n}) = u(x_{N_x}, t_{n}) = 0, \forall n \in \left{0,1,\cdots,N_t\right}
$$

## Physical Essence
Wave equations describe the oscillation, and the corresponding energy to preserve is
$$
E = \frac{1}{2} \int \left( u_t^2 + c^2 u_x^2 \right) \text{d} x.
$$

## Usage
To use this package it's quite easy:

```Julia
# here we see why it's named like this: to prevent mixing with DifferentialEquations. (Really?)
using DifferentialEquation

# parameter for wave equation
c=1.0

# parameter for discretization
Nx=100
Nt=100

# parameter for initial conditions
f=zero
g=(x->sin(2pi * x))

# choose a method
method="finite difference"

# return you with the 2d array U[i_x, n_t]
U=wave_func_solver(c=c, Nt=Nt, Nx=Nx, f=f, g=g, method=method)

# calculate the energy
Energy=fd_energy_evolv(c=c, Nt=Nt, Nx=Nx, f=f, g=g, method=method)
```

## Outlook
### Scaling
Lots of current parameters in our method can be vanished through some scaling technique.
This should make great difference since the finite difference method is not always reliable and the error accumulates along the evolution.
### Other Algorithms
### Plots

