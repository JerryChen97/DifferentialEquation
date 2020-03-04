using Test

# create the functions serving as the second initial conditions, i.e. the initial speeds of wave equation.
number_of_func = 10
harmonic_func_list = [(x->sin(rand()*x)) for n in 1:number_of_func]
gaussian_func_list = [(x->exp(-(rand()-x)^2/rand())) for n in 1:number_of_func]
random_func_list = [(x->rand()) for n in 1:number_of_func]
instanton_func_list = [(x->tanh(rand()*x)) for n in 1:number_of_func]
c_list = collect(0.1:0.1:1.0)


println("Tests on DifferentialEquation.jl begin!")



println("Tests on DifferentialEquation.jl end.")
