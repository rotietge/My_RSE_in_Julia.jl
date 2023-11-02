
# Activate the Julia project
using Pkg
Pkg.activate(@__DIR__)
Pkg.instantiate()

# load packages
#using LinearAlgebra
#using SparseArrays
#using Plots, LaTeXStrings



function trapezoidal_rule(func, a,b; N = 100)
  
    integral = 0 * func(0) #get right dimension for integral
    dx = (b .- a) / N

    
    x_last = a
    
    for i in range(0,1,N)
        x_next = x_last .+ dx
        integral = integral .+ (func(x_last) .+ func(x_next))/2 *dx
        x_last = x_next
    end
    
    return integral


end

function ftest1(x)
    return cos(200*x)
end

function ftest2(x)
    e = exp(2*im*x)
    return cos(e)/e * im *e
end

function ftest3(x)
    return [1, x, x^2, x^3]
end

function ftest4(x)
    return x*exp(x)
end

res1 = -1/200 *(sin(200)-sin(0))
res2 = 2*pi*im
res3 = [2,2,8/3,4]
res4 = trapezoidal_rule(ftest4,-1,2)
println(trapezoidal_rule(ftest1,0,1))
println(-1/200 *(sin(200)-sin(0)))
println()

println(trapezoidal_rule(ftest2,0,2*pi))
println(2*pi*im)
println()

println(trapezoidal_rule(ftest3,0,2))
println([2,2,8/3,4])
println()

println(trapezoidal_rule(ftest4,-1,2))
println(exp(2)+2*exp(-1))