module SymEngine
  class UndefFunction
    def initialize(n)
      @name = n
    end

    def call(*args)
      SymEngine::FunctionSymbol.new(@name, *args)
    end
  end
end
