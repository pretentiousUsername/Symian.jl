using Symbolics
using SymbolicUtils

const DEFINED_INTEGRAL_RULES = Dict{Tuple{Union{Expr, Symbol}, Symbol, Int}, Any}()

# see https://github.com/JuliaDiff/DiffRules.jl/blob/master/src/api.jl
# I'm using the DiffRules terminology for now, since it's already there and
# applicable to what I'm doing righ there---though I'll likely need to make this
# unique to Symian (or even make a new repo if other people like this package)
# later.
macro define_integral_rule(def)
    @assert isa(def, Expr) && def.head == :(=) "Integral rule does not have a left and right side"
    lhs = def.args[1]
    rhs = def.args[2]
    @assert isa(lhs, Expr) && lhs.head == :call "Left-hand side is not a function call"
    qualified_f = lhs.args[1]
    @assert isa(qualified_f, Expr) && qualified_f.head == :(.) "Function is not qualified by a module."
    M = qualified_f.args[2]
    f = _get_quoted_symbol(qualified_f.args[2])
    args = lhs.args[2:end]
    rule = Expr(:->, Expr(:tuple, args...), rhs)
    key = Expr(:tuple, Expr(:quote, M), Expr(:quote, f), length(args))
    return esc(quote
                   $Symian.DEFINED_INTEGRAL_RULES[$key] = $rule
                   $key
    end)
end

function _get_quoted_symbol(ex::Expr)
    @assert ex.head == :quote
    @assert length(ex.args) == 1 && isa(ex.args[1], Symbol) "Function not a single symbol"
    ex.args[1]
end

function _get_quoted_symbol(ex::QuoteNode)
    @assert isa(ex.value, Symbol) "Function not a single symbol"
    ex.value
end
