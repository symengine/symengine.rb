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
  end
end

require 'symengine/symengine'
require 'symengine/iruby'
require 'symengine/basic'
require 'symengine/integer'
require 'symengine/complex'
require 'symengine/complex_double'
