using DifferentialEquation
using PyPlot
using Statistics


function random_f(x)
    return rand()
end

center = rand()
d = rand()
function gaussian_rand(x)
    return exp(-(center-x)^2/d)
end

function get_energy_evolution(c)

    Nt = 100
    Nx = 100
    f  = (x -> x * (1 - x))
    U=wave_func_solver(c=c, Nt=Nt, Nx=Nx, g=random_f);energy_list = fd_energy_over_time_with_boundaries(U,c)
    return energy_list[2:Nt]

end

# get_energy_evolution(.9)


clf()
for c in 0.1:0.1:1.0
    energy_evolv = get_energy_evolution(c)
    println(var(energy_evolv))
    plot(energy_evolv)
end
xlabel("Time")
ylabel("Energy")
title(L"$f = random$")
display(gcf())
# savefig("plot.png")
