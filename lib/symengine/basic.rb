require 'set'

module SymEngine
  class Basic
    def inspect
      "#<#{self.class}(#{to_s})>"
    end

    def free_symbols
      pr_free_symbols.to_set
    end
  end
end
