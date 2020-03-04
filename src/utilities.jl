"""
    calculate the first-order derivative, excluding the boundary points
"""
function fd_first_derivative(U::Array{Float64, 2},index_x::Int, index_t::Int)

    # get the size of U and extract the lattice info
    size_U = size(U)
    Nx = size_U[1]-1
    Nt = size_U[2]-1

    # check if the input indices are illegal
    if index_x <= 1
        ArgumentError("Index of x wrong: smaller than or equal to 1")
    end
    if index_x > Nx
        ArgumentError("Index of x wrong: larger than Nx")
    end
    if index_t <= 1
        ArgumentError("Index of t wrong: smaller than or equal to 1")
    end
    if index_t > Nt
        ArgumentError("Index of t wrong: larger than Nt")
    end

    # x derivative, t derivative
    return (U[index_x+1, index_t] - U[index_x-1, index_t]) * Nx / 2, (U[index_x, index_t + 1] - U[index_x, index_t + 1]) * Nt / 2
    
end

"""
    calculate the first-order derivative, including the boundary points
"""
function fd_first_derivative_with_boundaries(U::Array{Float64, 2},index_x::Int, index_t::Int)

    # get the size of U and extract the lattice info
    size_U = size(U)
    Nx = size_U[1]-1
    Nt = size_U[2]-1

    # check if the input indices are illegal
    if index_x < 1
        ArgumentError("Index of x wrong: smaller than 1")
    end
    if index_x > Nx + 1
        ArgumentError("Index of x wrong: larger than Nx + 1")
    end
    if index_t < 1
        ArgumentError("Index of t wrong: smaller than 1")
    end
    if index_t > Nt + 1
        ArgumentError("Index of t wrong: larger than Nt + 1")
    end

    # x derivative
    if index_x > 1 && index_x <= Nx
        dx = (U[index_x+1, index_t] - U[index_x-1, index_t]) * Nx / 2
    end
    if index_x == 1
        dx = (U[index_x+1, index_t] - U[index_x, index_t]) * Nx
    end
    if index_x == Nx+1
        dx = (U[index_x, index_t] - U[index_x-1, index_t]) * Nx
    end
    # t derivative 
    dt = 0 
    if index_t > 1 && index_t <= Nt
        dt = (U[index_x, index_t + 1] - U[index_x, index_t - 1]) * Nt / 2
    end
    if index_t == 1
        dt = (U[index_x, index_t + 1] - U[index_x, index_t]) * Nt
    end
    if index_t == Nt+1
        dt = (U[index_x, index_t] - U[index_x, index_t - 1]) * Nt
    end
    return dx, dt
    
end

"""
    calculate the energy at specific t, without boundaries
"""
function fd_energy(U::Array{Float64, 2}, index_t::Int, c::Float64)

    # get the size of U and extract the lattice info
    size_U = size(U)
    Nx = size_U[1]-1
    Nt = size_U[2]-1

    # check if the input indices are illegal    
    if index_t <= 1
        ArgumentError("Index of t wrong: smaller than or equal to 1")
    end
    if index_t > Nx
        ArgumentError("Index of t wrong: larger than Nt")
    end

    energy_list = [0.0 for index_x in 2:Nx]
    for index_x in 2:Nx
        ux, ut = fd_first_derivative(U, index_x, index_t)
        energy = 0.5 * (ux^2 + c^2 * ut^2) / Nx
        energy_list[index_x-1] = energy
    end

    return sum(energy_list)
end

function fd_energy_over_time(U::Array{Float64, 2}, c::Float64)

    # get the size of U and extract the lattice info
    size_U = size(U)
    Nx = size_U[1]-1
    Nt = size_U[2]-1

    return [fd_energy(U, index_t, c) for index_t in 2:Nt]
    
end

"""
    calculate the first-order derivative, including the boundary points
"""
function fd_first_derivative_with_boundaries_v2(U::Array{Float64, 2},index_x::Int, index_t::Int)

    # get the size of U and extract the lattice info
    size_U = size(U)
    Nx = size_U[1]-1
    Nt = size_U[2]-1

    # check if the input indices are illegal
    if index_x < 1
        ArgumentError("Index of x wrong: smaller than 1")
    end
    if index_x > Nx + 1
        ArgumentError("Index of x wrong: larger than Nx + 1")
    end
    if index_t < 1
        ArgumentError("Index of t wrong: smaller than 1")
    end
    if index_t > Nt + 1
        ArgumentError("Index of t wrong: larger than Nt + 1")
    end

    # x derivative
    if index_x > 1 && index_x <= Nx
        dx = (U[index_x+1, index_t] - U[index_x-1, index_t])
    end
    if index_x == 1
        dx = (U[index_x+1, index_t] - U[index_x, index_t])
    end
    if index_x == Nx+1
        dx = (U[index_x, index_t] - U[index_x-1, index_t])
    end
    # t derivative 
    dt = 0 
    if index_t > 1 && index_t <= Nt
        dt = (U[index_x, index_t + 1] - U[index_x, index_t - 1])
    end
    if index_t == 1
        dt = (U[index_x, index_t + 1] - U[index_x, index_t])
    end
    if index_t == Nt+1
        dt = (U[index_x, index_t] - U[index_x, index_t - 1])
    end
    return dx, dt
    
end

"""
    calculate the energy at specific t, with boundaries
"""
function fd_energy_with_boundaries(U::Array{Float64, 2}, index_t::Int, c::Float64)

    # get the size of U and extract the lattice info
    size_U = size(U)
    Nx = size_U[1]-1
    Nt = size_U[2]-1

    # check if the input indices are illegal    
    if index_t < 1
        ArgumentError("Index of t wrong: smaller than 1")
    end
    if index_t > Nx + 1
        ArgumentError("Index of t wrong: larger than Nt+1")
    end

    energy_list = [0.0 for index_x in 1:Nx+1]
    for index_x in 1:Nx+1
        ux, ut = fd_first_derivative_with_boundaries_v2(U, index_x, index_t)
        energy = 0.5 * (c^2 * (Nt/Nx)^2 * ux^2 + ut^2) * Nx
        energy_list[index_x] = energy
    end

    return sum(energy_list)
end

function fd_energy_over_time_with_boundaries(U::Array{Float64, 2}, c::Float64)

    # get the size of U and extract the lattice info
    size_U = size(U)
    Nx = size_U[1]-1
    Nt = size_U[2]-1

    return [fd_energy_with_boundaries(U, index_t, c) for index_t in 1:Nt+1]
    
end

function fd_energy_evolv(;c::Float64=1.0, Nt::Int=100, Nx::Int=100, f=zero, g=(x->sin(2pi * x)), method="finite difference")

    U = wave_func_solver(c=c, Nt=Nt, Nx=Nx, f=f, g=g, method=method)
    return fd_energy_over_time_with_boundaries(U, c)[2:Nt]
    
end
