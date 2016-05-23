require 'spec_helper'

describe SymEngine do
  describe SymEngine::Complex do
    describe '.new' do
      context 'with a Ruby Complex object as input' do
        it 'returns an instance of SymEngine::Complex class' do
          a = Complex(2, 3)
          a = SymEngine::Complex.new(a)
          expect(a).to be_a SymEngine::Complex
          expect(a.to_s).to eq('2+3i')
        end
      end
      context 'with a Ruby Integer as input' do
        it 'returns an instance of SymEngine::Integer class' do
          a = SymEngine::Complex.new(2)
          expect(a).to be_a SymEngine::Integer
        end
      end
    end
  end
end
