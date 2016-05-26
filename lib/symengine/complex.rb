module SymEngine
  class Complex
    def to_c
        self.to_s.sub('I', 'i').sub('*','').gsub(' ','').to_c
    end
  end
end 
