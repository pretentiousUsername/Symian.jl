# just for now
using SymbolicUtils
using Symbolics

using Symbolics: isarraysymbolic, array_term

struct AbstractIntegral end # currently doesn't do much, but it might

#associativity = @rule 


#=
## this is stolen from the Symbolics source code, `diff.jl`, specifically
abstract type Operator end
propagate_shape(::Operator, x) = axes(x)

struct Integral <: Operator

end

function (I::Integral)(x)
    x = unwrap(x)
    if isarraysymbolic(x)
        array_term(D, x)
    else
        term(D, x)
    end
end
=#
