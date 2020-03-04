using DifferentialEquation
using PyPlot
x = collect(range(0, length=101, stop=1));
y = collect(range(0, length=101, stop=1));
A = wave_func_solver(c=0.1)
title("The solution of wave equation")
surf(A)
display(gcf())
