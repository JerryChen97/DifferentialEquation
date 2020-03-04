using Test
using Statistics
using DifferentialEquation
using PyPlot

# create the functions serving as the second initial conditions, i.e. the initial speeds of wave equation.
number_of_func = 10
harmonic_func_list = [(x->sin(rand()*x)) for n in 1:number_of_func]

rand_mean = [rand() for n in 1:number_of_func]
rand_var = [rand() for n in 1:number_of_func]
gaussian_func_list = [(x->exp(-(rand_mean[n]-x)^2/rand_var[n])) for n in 1:number_of_func]

random_func_list = [(x->rand()) for n in 1:number_of_func]

rand_coef = [rand() for n in 1:number_of_func]
instanton_func_list = [(x->tanh(rand_coef[n]*x)) for n in 1:number_of_func]
c_list = collect(0.1:0.1:1.0)


println("Tests on DifferentialEquation.jl begin!")

@testset "Energy Convergence" begin
    include("energy_convergence.jl")
end

@testset "Different Resolution" begin
    include("resolution.jl")
end


println("Tests on DifferentialEquation.jl end.")
