using DifferentialEquation
using PyPlot


function get_energy_evolution(c)

    Nt = 100
    Nx = 100
    f  = (x -> x * (1 - x))
    U=wave_func_solver(c=c, Nt=Nt, Nx=Nx);energy_list = fd_energy_over_time_with_boundaries(U,c)
    return energy_list[2:Nt]

end

# get_energy_evolution(.9)


clf()
for c in 0.1:0.1:1.0
    plot(get_energy_evolution(c))
end
xlabel("Time")
ylabel("Energy")
display(gcf())
