@doc raw"""
    finite_difference()
    carry the most fundamental computation of a `1+1`-dimensional wave equation
    ```math
        \left(\frac{\partial^2}{\partial_t^2} - c^2 \cdot \frac{\partial^2}{\partial_x^2}right) u(x, t) = 0
    ```
    with the default boundary conditions `u(0, t) = 0` and `u(1, t) = 0` 
    and the default initial conditions `u(x, 0) = 0` and `u_t(x, 0) = \sin(2 \pi x)`
"""
function finite_difference(c=1, Nt=100, Nx=100, )
    # print("Hello Jerry!")

end