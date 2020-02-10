module CGAL

include("mappings.jl") # early jl/c++ mappings

using CxxWrap
using libcgal_julia_jll
const libcgal_julia = haskey(ENV, "JLCGAL_EXACT_CONSTRUCTIONS") ?
                      libcgal_julia_exact :
                      libcgal_julia_inexact
@wrapmodule(get(ENV, "JLCGAL_LIBPATH", libcgal_julia))

__init__() = @initcxx

include("origin.jl")
include("enum.jl")
include("kernel.jl")
include("algebra.jl")
include("global_kernel_functions.jl")
include("voronoi_delaunay.jl")

include("visual.jl")

end # module CGAL
