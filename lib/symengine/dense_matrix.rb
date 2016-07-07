module SymEngine
  class MatrixBase
    def inspect
      "#<#{self.class}(#{rows}x#{cols})>"
    end
  end
end
