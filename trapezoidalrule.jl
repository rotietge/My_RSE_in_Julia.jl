
# Activate the Julia project
using Pkg
Pkg.activate(@__DIR__)
Pkg.instantiate()

# load packages
#using LinearAlgebra
#using SparseArrays
#using Plots, LaTeXStrings



function trapezoidal_rule(function, a,b; N = 100)
  
    integral = 0
    dx = (b-a)/N
    x_last = a
    
    for i in range N
        x_next = x_last + dx
        integral = integral + (function(x_last) + function(x_next))/2 * dx
        x_last = x_next
    end
    return integral


end

function ftest1(x)
    return cos(200*x)
end

ftest1(2)





