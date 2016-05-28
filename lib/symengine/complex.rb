module SymEngine
  class Complex
    def to_c
        to_s.tr('I', 'i').tr('*','').tr(' ','').to_c
    end
  end
end 
