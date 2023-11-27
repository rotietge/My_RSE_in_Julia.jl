using Test
#using .My_RSE_in_Julia

testfunc(x) = 1


@test isapprox(trapezoidal_rule(testfunc,0,2),2.)