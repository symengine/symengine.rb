module SymEngine
  class << self
    # Defines a shortcut for SymEngine::Symbol.new() allowing multiple symbols
    # to be created all at once.
    #
    # Examples:
    #
    #    x, y = SymEngine.symbols(%i{x y})
    #    x, y = SymEngine.symbols(%w{x y})
    #    x, y = SymEngine.symbols([:x, :y])
    #    x, y = SymEngine.symbols(['x', 'y'])
    #    x, y = SymEngine.symbols('x', 'y')
    #    x, y = SymEngine.symbols('x y')
    #    
    def symbols ary_or_string, *params
      # Want to make sure we can accept an array or a bunch of splatted arguments
      if params.size > 0
        ary_or_string = (ary_or_string.is_a?(String) ? [ary_or_string] : ary_or_string).concat(params)
      elsif ary_or_string.is_a?(String)
        # or accept a string
        ary_or_string = ary_or_string.split
      end

      # Make an Array of SymEngine::Symbols from the parameters we received,
      # now that they're normalized.
      ary_or_string.map do |symbol_or_string| 
        SymEngine::Symbol.new(symbol_or_string)
      end
    end    
    def Function(n)
      return SymEngine::UndefFunction.new(n)
    end
    def evalf(operand, prec=53, real=false)
        return _evalf(operand, prec, real)
    end
    def evalf_dirichlet_eta(exp)
        SymEngine::evalf(SymEngine::dirichlet_eta(exp))
    end
    def evalf_zeta(exp)
        SymEngine::evalf(SymEngine::zeta(exp))
    end
    def lambdify_code(exp)
      sym_map = exp.free_symbols.map { |sym| sym.to_s}.join(",")
      str = exp.to_s
      str.gsub!(/[\d\.]+/, 'Rational(\0,1)')
      replacements = { sin:"Math.sin", cos: "Math.cos", tan: "Math.tan",
                       asin:"Math.asin", acos: "Math.acos", atan: "Math.atan",
                       sinh:"Math.sinh", cosh: "Math.cosh", tanh: "Math.tanh",
                       asinh:"Math.asinh", acosh: "Math.acosh", atanh: "Math.atanh", 
                       pi: "Math::PI", E: "Math::E",
                       dirichlet_eta: "SymEngine::evalf_dirichlet_eta",
                       zeta: "SymEngine::evalf_zeta", gamma: "Math.gamma" }
      replacements.each {|key, value| str.gsub!(/(\b#{key}\b)/, value)}
      "lambda { | #{sym_map} | #{str} }"
    end
    def lambdify(exp)
      eval(lambdify_code(exp))
    end
  end
end

require 'symengine/symengine'
require 'symengine/iruby'
require 'symengine/basic'
require 'symengine/integer'
require 'symengine/complex'
require 'symengine/complex_double'
require 'symengine/undef_function'
