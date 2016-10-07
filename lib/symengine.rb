require 'backports'

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
    def symbols(ary_or_string, *params)
      # Want to make sure we can accept an array or a bunch of splatted arguments
      if !params.empty?
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

    def Function(n) # rubocop:disable Style/MethodName
      SymEngine::UndefFunction.new(n)
    end

    def evalf(operand, prec = 53, real = false)
      _evalf(operand, prec, real)
    end

    def lambdify(exp, *syms)
      syms.flatten!
      if exp.free_symbols.count > syms.length
        raise ArgumentError, 'Formula contains #{exp.free_symbols.count} free '\
                             'symbols. You should provide at least this number '\
                             'of arguments (only #{syms.length} given).'
      end
      # TODO: Implement one of the two options below.
      # 1. check that all the symbol names and function names are valid.
      # 2. wrap symengine's LambdaRealDouble into C and then to ruby
      eval(SymEngine::Utils.lambdify_code(exp, syms))
    end
  end
  module Utils
    class << self
      REPLACEMENTS = { sin: 'Math.sin', cos: 'Math.cos', tan: 'Math.tan',
                       asin: 'Math.asin', acos: 'Math.acos', atan: 'Math.atan',
                       sinh: 'Math.sinh', cosh: 'Math.cosh', tanh: 'Math.tanh',
                       asinh: 'Math.asinh', acosh: 'Math.acosh', atanh: 'Math.atanh',
                       pi: 'Math::PI', E: 'Math::E', I: '::Complex::I',
                       dirichlet_eta: 'SymEngine::Utils::evalf_dirichlet_eta',
                       zeta: 'SymEngine::Utils::evalf_zeta', gamma: 'Math.gamma' }.map { |from, to| [/(\b#{from}\b)/, to] }.to_h.freeze
      def evalf_dirichlet_eta(exp)
        SymEngine.evalf(SymEngine.dirichlet_eta(exp))
      end

      def evalf_zeta(exp)
        SymEngine.evalf(SymEngine.zeta(exp))
      end

      def lambdify_code(exp, syms)
        body = exp.to_s.gsub(/[\d\.]+/, 'Rational(\0,1)')
        sym_map = syms.join(',')
        rubified_body = REPLACEMENTS.inject(body) { |res, (from, to)| res.gsub(from, to) }
        "proc { | #{sym_map} | #{rubified_body} }"
      end
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
