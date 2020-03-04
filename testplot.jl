using DifferentialEquation
using PyPlot
x = collect(range(0, length=101, stop=1));
y = collect(range(0, length=101, stop=1));
A = finite_difference(c=2.0)
surf(x, y, A)
title("The solution of wave equation")
display(gcf())
