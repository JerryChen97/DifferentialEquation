module DifferentialEquation

export wave_func_solver

include("finite_difference.jl")
supported_method_list = ["finite difference",]
method_dict = Dict("finite difference"=>finite_difference,)



end # module
