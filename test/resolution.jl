# standard deviation criteria for energy to be viewed as convergent
criteria = 1e-2


println("Our criteria for energy is standart deviation < ", criteria)

@testset "$func initial speed at resolution $resolution" for func in [:harmonic, :gaussian, :random, :instanton], resolution in [10, 100, 1000, 10000]

    clf()

    mean_energy_list = []
    error_energy_list = []

    for func in getfield(Main,(Symbol("$(func)_func_list")))

        energy_evolv_list = fd_energy_evolv(g=func, Nt=(resolution), Nx=(resolution))
        plot(energy_evolv_list)

        meanvalu = Statistics.mean(energy_evolv_list)
        variance = Statistics.std(energy_evolv_list)

        append!(mean_energy_list, meanvalu)
        append!(error_energy_list, variance)

        @test (variance<criteria)
    end
    xlabel("Time")
    ylabel("Energy")
    title("$(func) energy evolution at res=$(resolution)")
    savefig("$(func)_func_energy_reso_$(resolution).png")

    clf()
    errorbar(collect(1:10), mean_energy_list, error_energy_list, fmt="o")
    title("$(func) test result at res=$(resolution)")
    savefig("$(func)_func_energy_evolv_reso_$(resolution).png")

end
