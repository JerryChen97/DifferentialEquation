# DifferentialEquation
This is a repo for the homework 2 of computational physics

## Introduction
In this module we will make use of finite difference method to solve the scalar wave equation in 1+1 dimensions:

### ![\partial_t^2 u + c^2 \partial_x^2 u = 0](https://render.githubusercontent.com/render/math?math=%5Cpartial_t%5E2%20u%20%2B%20c%5E2%20%5Cpartial_x%5E2%20u%20%3D%200)

with default boundary conditions
![u(0, t) = u(1, t) = 0](https://render.githubusercontent.com/render/math?math=u(0%2C%20t)%20%3D%20u(1%2C%20t)%20%3D%200)
and initial conditions 
![u(x, 0) = f(x)](https://render.githubusercontent.com/render/math?math=u(x%2C%200)%20%3D%20f(x)), ![u_t(x, 0) = g(x)](https://render.githubusercontent.com/render/math?math=u_t(x%2C%200)%20%3D%20g(x))

## Algorithm

This is a classical problem, and there are many different methods to approach the correct solution.

Here we choose the finite difference method as our primary choice since it is easiest to implement and most straightforward to understand.


### Finite Difference

By finite difference method, we can express the derivatives as the difference between lattice points:

![f''(x_n) = \frac{f(x_{n-1})+f(x_{n+1})-2f(x_n)}{\Delta x^2}](https://render.githubusercontent.com/render/math?math=f''(x_n)%20%3D%20%5Cfrac%7Bf(x_%7Bn-1%7D)%2Bf(x_%7Bn%2B1%7D)-2f(x_n)%7D%7B%5CDelta%20x%5E2%7D)

so here for our wave equation we have
![\frac{u_{i}^{n+1}-2 u_{i}^{n}+u_{i}^{n-1}}{\Delta t^{2}}=c^{2} \frac{u_{i+1}^{n}-2 u_{i}^{n}+u_{i-1}^{n}}{\Delta x^{2}}](https://render.githubusercontent.com/render/math?math=%5Cfrac%7Bu_%7Bi%7D%5E%7Bn%2B1%7D-2%20u_%7Bi%7D%5E%7Bn%7D%2Bu_%7Bi%7D%5E%7Bn-1%7D%7D%7B%5CDelta%20t%5E%7B2%7D%7D%3Dc%5E%7B2%7D%20%5Cfrac%7Bu_%7Bi%2B1%7D%5E%7Bn%7D-2%20u_%7Bi%7D%5E%7Bn%7D%2Bu_%7Bi-1%7D%5E%7Bn%7D%7D%7B%5CDelta%20x%5E%7B2%7D%7D)
where we denote the time indices by n and space indices by i.

Therefore, we can derive that the update rule for our states ![u_i^n](https://render.githubusercontent.com/render/math?math=u_i%5En)
![u_{i}^{n+1}=-u_{i}^{n-1}+2 u_{i}^{n}+C^{2}\left(u_{i+1}^{n}-2 u_{i}^{n}+u_{i-1}^{n}\right)](https://render.githubusercontent.com/render/math?math=u_%7Bi%7D%5E%7Bn%2B1%7D%3D-u_%7Bi%7D%5E%7Bn-1%7D%2B2%20u_%7Bi%7D%5E%7Bn%7D%2BC%5E%7B2%7D%5Cleft(u_%7Bi%2B1%7D%5E%7Bn%7D-2%20u_%7Bi%7D%5E%7Bn%7D%2Bu_%7Bi-1%7D%5E%7Bn%7D%5Cright))

