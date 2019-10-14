:warning: **DISCLAIMER** :warning: As it stands, this package is terribly
experimental. See [libcgal-julia][3] for more information.

# CGAL.jl - [CGAL][1] meets [Julia][2]

A package exposing a series of types, constructs, functions, and predicates from
[CGAL][1] (Computational Geometry Algorithms Library), a powerful, reliable, and
efficient C++ library

This package is supported by a C++ wrapper around CGAL in the form of
[libcgal-julia](https://github.com/rgcv/libcgal-julia), itself powered by
[JlCxx][3].

# Usage

Since the kernel is being fixed on the C++ side, the usual `typedefs` you see
in CGAL's examples aren't as common. Here's [one of CGAL's examples][4]
translated to Julia using this package:

```jl
# points_and_segments.jl
using CGAL

p, q = Point2(1, 1), Point2(10, 10)

println("p = $p")
println("q = $(x(q)) $(y(q))")

println("sqdist(p,q) = $(squared_distance(p, q))")

s = Segment2(p, q)
m = Point2(5, 9)

println("m = $m")
println("sqdist(Segment2(p,q), m) = $(squared_distance(s, m))")

print("p, q, and m ")
let o = orientation(p, q, m)
    if     o == COLLINEAR  println("are collinear")
    elseif o == LEFT_TURN  println("make a left turn")
    elseif o == RIGHT_TURN println("make a right turn")
    end
end

println(" midpoint(p,q) = $(midpoint(p, q))")
```

**N.B.**: At the time of writing, `squared_distance` and `midpoint` aren't yet
available. Nonetheless, they can *fortunately* be mapped with little effort.

# Installation

Until it some day makes its way to the official Julia package registry, you can
add it directly from this repo right here! Drop into a REPL and type de
following:

```jl
julia> import Pkg; Pkg.add("https://github.com/rgcv/CGAL.jl")
```
Alternatively, in a blank REPL, after hitting `]`,
```jl
pkg> add https://github.com/rgcv/CGAL.jl
```

[1]: https://github.com/CGAL/cgal
[2]: https://github.com/julialang/julia
[3]: https://github.com/JuliaInterop/libcxxwrap-julia
[4]: https://doc.cgal.org/latest/Kernel_23/Kernel_23_2points_and_segment_8cpp-example.html
