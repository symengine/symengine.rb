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
    def to_proc()
      if self.free_symbols.count > 1
        raise ArgumentError, "Too many free symbols! Only 1 allowed. Found #{self.free_symbols.count}."
      end
      SymEngine::lambdify(self, self.free_symbols.map {|s| s.to_s})
    end
  end
end
