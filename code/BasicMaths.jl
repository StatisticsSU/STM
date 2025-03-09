using Plots, LaTeXStrings, LinearAlgebra, Measures
using Utils: colors

courseFolder = "/home/mv/Dropbox/Teaching/STM/"
figFolder = courseFolder*"slides/figs/"
dataFolder = courseFolder*"data/"

Plots.reset_defaults()
gr(legend = nothing, grid = false, color = colors[1], lw = 3,
    xtickfontsize=12, ytickfontsize=12, xguidefontsize=16, 
    yguidefontsize=16, legendfontsize=14, titlefontsize = 18)

# Bank account example
a = 100
b = 1.05
plot(0:3, a*b.^(0:3), color = colors[1], xlab = "year", ylab = "capital",
    label = "", lw = 3, xticks = 0:3, yticks = 100:5:120, title = "First three years")
savefig(figFolder*"powersBank.pdf")
plot(0:50, a*b.^(0:50), color = colors[1], xlab = "year", ylab = "capital", 
    label = "", lw = 3, xticks = 0:5:50, yticks = 0:100:1100, title = "First 50 years")
savefig(figFolder*"powersBankLong.pdf")

gr(legend = nothing, grid = false, color = colors[1], lw = 3,
    xtickfontsize=12, ytickfontsize=12, xguidefontsize=18, 
    yguidefontsize=18, legendfontsize=16, titlefontsize = 18)

# Exponential function
xGrid = -2:0.01:2
plot(xGrid, exp.(xGrid), label = L"e^{x}", legend = :topleft, xlabel = L"x", ylabel = L"y")
savefig(figFolder*"expFunc.pdf")

xGrid = -2:0.01:2
plot(xGrid, exp.(xGrid), label = L"e^{x}", 
    legend = :topleft, xlabel = L"x", ylabel = L"y")
plot!(xGrid, exp.(1.5*xGrid), label = L"e^{1.5x}", color = colors[2])
plot!(xGrid, exp.(-xGrid), label = L"e^{-x}", color = colors[3])
savefig(figFolder*"expFuncSeveral.pdf")
    

# Logarithm function
xGrid = 0.01:0.01:3
plot(xGrid, log.(xGrid), label = L"\ln(x)", legend = :bottomright, 
    xlabel = L"x", ylabel = L"y", yticks = -8:2:8)
plot!(xGrid, log10.(xGrid), label = L"\log_{10}(x)", color = colors[2])
plot!(xGrid, log2.(xGrid), label = L"\log_{2}(x)", color = colors[3])
savefig(figFolder*"logFunc.pdf")

xGrid = 0.01:0.1:100
plot(xGrid, log.(xGrid), label = L"\ln(x)", legend = :bottomright, 
    xlabel = L"x", ylabel = L"y", yticks = -8:2:8)
plot!(xGrid, log10.(xGrid), label = L"\log_{10}(x)", color = colors[2])
plot!(xGrid, log2.(xGrid), label = L"\log_{2}(x)", color = colors[3])
savefig(figFolder*"logFuncLargerDomain.pdf")


