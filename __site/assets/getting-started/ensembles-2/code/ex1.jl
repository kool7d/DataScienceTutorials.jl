# This file was generated, do not modify it. # hide
using MLJ
using PyPlot
using PrettyPrinting
using StableRNGs
import DataFrames

MLJ.color_off() # hide
ioff() # hide
X, y = @load_boston
sch = schema(X)
p = length(sch.names)
n = sch.nrows
@show (n, p)
DataFrames.describe(y)