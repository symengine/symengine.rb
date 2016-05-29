module SymEngine
  class ComplexDouble
    def to_c
        to_s.tr('I', 'i').delete(" *").to_c
    end
  end
end 
