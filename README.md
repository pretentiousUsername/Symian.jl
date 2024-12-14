# Symian – a symbolic integration package for [`Symbolics.jl`][symbolics]
Symian (**Sym**bolic **i**ntegrator **a**nd other **n**ouns) is a symbolic
integrator package which will initially perform some very simple integrals,
but afterwards it will be based off of the [RUBI][rubi] package, along
with some other things---it's designed to be good at doing integrals and
nothing else. The end-goal is to have a package that can handle, among other
things, integrals for non-commutative variables (such as operators in quantum
mechanics), complex analysis, path integrals, and a bunch of other stuff.

However, for the time being, Symian will be relegated to basically being a
parlor trick—it will let you do integrals that you see in college calculus
courses, and just about nothing else.



[symbolics]: https://github.com/JuliaSymbolics/Symbolics.jl

[rubi]: https://rulebasedintegration.org/
