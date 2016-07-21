require 'set'

module SymEngine
  class Basic
    def inspect
      "#<#{self.class}(#{to_s})>"
    end

    def free_symbols
      pr_free_symbols.to_set
    end
    
    def abs
      SymEngine::abs(self)
    end
    def to_proc(*args)
      if(args.length == 0)
        if self.free_symbols.count > 1
          raise ArgumentError, "Too many free symbols! Only 1 allowed. Found #{self.free_symbols.count}."
        end
        SymEngine::lambdify(self, self.free_symbols.map {|s| s})
      else
        if self.free_symbols.count > args.length
          raise ArgumentError, "#{self.free_symbols.count} Free Symbols. Only #{args.length} given."
        end
        SymEngine::lambdify(self, args)
      end
    end
  end
end
