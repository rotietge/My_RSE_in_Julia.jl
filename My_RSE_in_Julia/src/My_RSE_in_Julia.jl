module My_RSE_in_Julia

export trapezoidal_rule

# Activate the Julia project
using LaTeXStrings

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



function plotConvergence(func, a,b, result; nstart = 1, nstep = 10, nstop = 100)   
     
        n_plot =[]
        diff_plot = []
        for n in range(nstart,nstep,nstop)
            append!(n_plot, n)
            append!(diff_plot, trapezoidal_rule(func,a, b)-result)
        end
        
     
     plot(n_plot, diff_plot, xguide = L"N", yguide = L"diff to real integral", label = "")
end


println(trapezoidal_rule(ftest1,0,1))


println(trapezoidal_rule(ftest2,0,2*pi))

println(trapezoidal_rule(ftest3,0,2))

println(trapezoidal_rule(ftest4,-1,2))

testfunc(x) = 1

println(trapezoidal_rule(testfunc,0,2))

#simpel wäre unicode-plots, error message
#ERROR: could not load library "libGR.dll"
#The specified module could not be found.
#plotConvergence(ftest1,0,1,res1)



end # module My_RSE_in_Julia
