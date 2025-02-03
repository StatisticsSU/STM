using LinearAlgebra, Plots, Distributions, LaTeXStrings, Measures
using Utils: colors

figFolder = "/home/mv/Dropbox/Teaching/STM/tutorial/basicmath/figs"

Plots.reset_defaults()
gr(legend = nothing, grid = false, color = colors[1], lw = 3,
    xtickfontsize=14, ytickfontsize=14, xguidefontsize=18, 
    yguidefontsize=18, legendfontsize=14, titlefontsize = 24)

# Exponential function

xGrid = -2:0.01:2
plot(xGrid, exp.(xGrid), label = nothing,
    legend = :topleft, xlabel = L"x", ylabel = L"y = e^x")
savefig(figFolder*"expFunc.pdf")

xGrid = -2:0.01:2
plot(xGrid, exp.(xGrid), label = L"e^{x}", 
    legend = :topleft, xlabel = L"x", ylabel = L"y")
plot!(xGrid, exp.(1.5*xGrid), label = L"e^{1.5x}", color = colors[2])
plot!(xGrid, exp.(-xGrid), label = L"e^{-x}", color = colors[3])
savefig(figFolder*"expFuncSeveral.pdf")

