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
    return fd_energy_evolv(c=c, Nt=Nt, Nx=Nx, g=random_f)

end

# get_energy_evolution(.9)


clf()
# for c in 0.1:0.1:1.0
#     energy_evolv = get_energy_evolution(c)
#     println(var(energy_evolv))
#     # plot(energy_evolv)
# end
x = [c for c in 0.1:0.1:1.0]
energy_evolv_list = [get_energy_evolution(c) for c in x]
y = [mean(energy_evolv) for energy_evolv in energy_evolv_list]
error = [Statistics.std(energy_evolv) for energy_evolv in energy_evolv_list]
xlabel("c")
ylabel("Energy")
title(L"$f = random$")
errorbar(x, y, error, fmt="o")
display(gcf())
# savefig("plot.png")
