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

By finite difference method, we can express the derivatives as the difference between lattice points:

<p align="center"><img src="/tex/44c377ef0d2cd5bf32df24473e1ba3ad.svg?invert_in_darkmode&sanitize=true" align=middle width=277.94719095pt height=34.7253258pt/></p>

so here for our wave equation we have

<p align="center"><img src="/tex/8e506e156bc88920c722143bf25e4392.svg?invert_in_darkmode&sanitize=true" align=middle width=307.29408105pt height=36.844036349999996pt/></p>

where we denote the time indices by n and space indices by i.

Therefore, we can derive that the update rule for our states <img src="/tex/6302bc0298881fdd4cf1954733ad3f9a.svg?invert_in_darkmode&sanitize=true" align=middle width=17.53629569999999pt height=21.839370299999988pt/>

<p align="center"><img src="/tex/043649d8cfb659b76bdee4ca1c01177e.svg?invert_in_darkmode&sanitize=true" align=middle width=360.98145765pt height=36.98103915pt/></p>

If we denote <img src="/tex/f444ea4c61729930db7b7d7fb6b020aa.svg?invert_in_darkmode&sanitize=true" align=middle width=61.69672244999999pt height=28.670654099999997pt/>, then we can sort the formula above as 
<p align="center"><img src="/tex/27f74ece5523d39264446e1350400a6a.svg?invert_in_darkmode&sanitize=true" align=middle width=348.3092514pt height=20.3994087pt/></p>
