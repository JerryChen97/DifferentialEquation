@doc raw"""
    finite_difference()
    carry the most fundamental computation of a `1+1`-dimensional wave equation
    ```math
        \left(\frac{\partial^2}{\partial_t^2} - c^2 \cdot \frac{\partial^2}{\partial_x^2}right) u(x, t) = 0
    ```
    with the default boundary conditions `u(0, t) = 0` and `u(1, t) = 0` and the default initial conditions `u(x, 0) = f(x) = 0` and `u_t(x, 0) = g(x) = \sin(2 \pi x)`
"""
function finite_difference(;c::Float64=1.0, Nt::Int=100, Nx::Int=100, f=zero, g=(x->sin(2pi * x)))
    # print("Hello Jerry!")

    # test if the input initial conditions are correct or not
    if f(0.0) ≈ 0 && f(1.0) ≈ 0
    else
        ArgumentError("The input initial condition function f not satisfying the boundary condition f(0) = f(1) = 0")

    # some intermediate parameters used in the finite difference algorithm
    r = c * Nx / Nt
    Δt = 1.0 / Nt 
    Δx = 1.0 / Nx 

    # our algorithm considers the x points indexing from 0 to Nx and the t points indexing from 0 to Nt.
    U = zeros(Float64, Nx+1, Nt+1)
    # functions for calculating the corresponding x or t coordinate given specific index.
    x_mesh = (index -> (index-1.0)/Nx)
    t_mesh = (index -> (index-1.0)/Nt)

    # impose the boundary conditions(, which is actually a redundant action)
    for i_t in 1:(Nt+1)
        U[1, i_t] = 0
        U[Nx+1, i_t] = 0
    end

    # impose the initial condition f 
    for i_x in 2:Nx
        x = x_mesh(i_x)
        U[i_x, 1] = f(x)
    end
    # impose the initial condition g 
    for i_x in 2:Nx
        x = x_mesh(i_x)
        U[i_x, 2] = 0.5 * (r^2 * U[i_x+1, 1] + 2 * (1 - r^2) * U[i_x, 1] + r^2 * U[i_x - 1, 1]) + Δt * g(x)
    end

    # carry the iteration for finite difference method
    for i_t in 3:(Nt+1)
        for i_x in 2:Nx
            U[i_x, i_t] = r^2 * U[i_x+1, i_t-1] + 2 * (1 - r^2) * U[i_x, i_t-1] + r^2 * U[i_x-1, i_t-1] - U[i_x, i_t-2]
        end
    end

    return U
    
end