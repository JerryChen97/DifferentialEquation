# standard deviation criteria for energy to be viewed as convergent
criteria = 1e-2
pass = (std -> (std<criteria))

println("Our criteria for energy is standart deviation < ", criteria)

@testset "$func initial speed" for func in [:harmonic, :gaussian, :random, :instanton]

    clf()

    mean_energy_list = []
    error_energy_list = []

    for func in getfield(Main,(Symbol("$(func)_func_list")))

        energy_evolv_list = fd_energy_evolv(g=func)
        plot(energy_evolv_list)

        meanvalu = Statistics.mean(energy_evolv_list)
        variance = Statistics.std(energy_evolv_list)

        append!(mean_energy_list, meanvalu)
        append!(error_energy_list, variance)

        @test pass(variance)
    end
    xlabel("Time")
    ylabel("Energy")
    title("$(func) energy evolution")
    savefig("$(func)_func_energy.png")

    clf()
    errorbar(collect(1:10), mean_energy_list, error_energy_list, fmt="o")
    savefig("$(func)_func_energy_evolv.png")

end
