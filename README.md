# DifferentialEquation
This is a repo for the homework 2 of computational physics

## Introduction
In this module we will make use of finite difference method to solve the scalar wave equation in 1+1 dimensions:

<p align="center"><img src="/tex/ad532901ecfbc2f0182429c2cee2bf9c.svg?invert_in_darkmode&sanitize=true" align=middle width=117.56657219999998pt height=18.2666319pt/></p>

with default boundary conditions
<p align="center"><img src="/tex/421d69a5b57a1457fc62b64eb6a85191.svg?invert_in_darkmode&sanitize=true" align=middle width=139.3682631pt height=16.438356pt/></p>
and initial conditions 
<p align="center"><img src="/tex/8a7c1b1eeb192f53dc9b52d18926de68.svg?invert_in_darkmode&sanitize=true" align=middle width=101.03125229999999pt height=16.438356pt/></p>

## Algorithm

This is a classical problem, and there are many different methods to approach the correct solution.

Here we choose the finite difference method as our primary choice since it is easiest to implement and most straightforward to understand.


### Finite Difference

By finite difference method, we can express the derivatives as the difference between lattice points, which are discretized by <img src="/tex/3919bbc84b8079e27194efe99a1f6a80.svg?invert_in_darkmode&sanitize=true" align=middle width=23.09366069999999pt height=22.465723500000017pt/>:

<p align="center"><img src="/tex/44c377ef0d2cd5bf32df24473e1ba3ad.svg?invert_in_darkmode&sanitize=true" align=middle width=277.94719095pt height=34.7253258pt/></p>

so here for our wave equation we have

<p align="center"><img src="/tex/e3afcc9b166c3ba60bb16156b26e79db.svg?invert_in_darkmode&sanitize=true" align=middle width=559.615452pt height=34.7253258pt/></p>

where we denote the time indices by n and space indices by i.

Therefore, we can derive that the update rule for our states <img src="/tex/6302bc0298881fdd4cf1954733ad3f9a.svg?invert_in_darkmode&sanitize=true" align=middle width=17.53629569999999pt height=21.839370299999988pt/>

<p align="center"><img src="/tex/b61c261e9e2eccdacd0a87c44c1cda56.svg?invert_in_darkmode&sanitize=true" align=middle width=623.80521885pt height=33.62942055pt/></p>

If we denote <img src="/tex/f444ea4c61729930db7b7d7fb6b020aa.svg?invert_in_darkmode&sanitize=true" align=middle width=61.69672244999999pt height=28.670654099999997pt/>, then we can sort the formula above as 
<p align="center"><img src="/tex/94acc5eacc9ed949385a4b28e99334c5.svg?invert_in_darkmode&sanitize=true" align=middle width=578.8583724pt height=18.312383099999998pt/></p>

Meanwhile, due to the extensibility and uniqueness of the solution of wave equations, the initial condition shows that
<p align="center"><img src="/tex/cfcf98a829e439ba5d98f0e1a1ba9c66.svg?invert_in_darkmode&sanitize=true" align=middle width=531.69560895pt height=32.990165999999995pt/></p>
and the boundary conditions are 
<p align="center"><img src="/tex/f018c4b328d47da30851b8172a59ba82.svg?invert_in_darkmode&sanitize=true" align=middle width=315.10891664999997pt height=16.438356pt/></p>

## Physical Essence
Wave equations describe the oscillation, and the corresponding energy to preserve is
<p align="center"><img src="/tex/43f476bab737de82cfbb595f26ea5a22.svg?invert_in_darkmode&sanitize=true" align=middle width=179.03450399999997pt height=36.53007435pt/></p>

## Outlook
### Scaling
Lots of current parameters in our method can be vanished through some scaling technique.
This should make great difference since the finite difference method is not always reliable and the error accumulates along the evolution.
### Other Algorithms
### Plots

