require 'set'

module SymEngine
  class Basic
    def inspect
      "#<#{self.class}(#{self})>"
    end

    def free_symbols
      pr_free_symbols.to_set
    end

    def abs
      SymEngine.abs(self)
    end

    def to_proc(*args)
      if args.empty?
        if free_symbols.count > 1
          raise ArgumentError, 'You should provide symbols order for #to_proc'\
                               '. Only formulae with 1 free symbol can deduce'\
                               ' its name automatically (#{free_symbols.count}'\
                               ' found in #{self}).'
        end
        return SymEngine.lambdify(self, free_symbols.map { |s| s })
      else
        if free_symbols.count > args.length
          raise ArgumentError, 'Formula contains #{free_symbols.count} free '\
                               'symbols. You should provide at least this number '\
                               'of arguments (only #{args.length} given).'
        end
        return SymEngine.lambdify(self, args)
      end
    end
  end
end
