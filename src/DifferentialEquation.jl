module DifferentialEquation

export wave_func_solver, fd_energy_over_time, fd_energy_over_time_with_boundaries, fd_energy_evolv

include("utilities.jl")
include("finite_difference.jl")
supported_method_list = ["finite difference",]
method_dict = Dict("finite difference"=>finite_difference,)



end # module
