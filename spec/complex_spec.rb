require 'spec_helper'

describe SymEngine do
  describe SymEngine::Complex do
    describe '.new' do
      context 'with a Ruby Complex object as input' do
        it 'returns an instance of SymEngine::Complex class' do
          a = Complex(2, 3)
          a = SymEngine::sympify(a)
          expect(a).to be_an_instance_of SymEngine::Complex
          expect(a.to_s).to eq('2 + 3*I')
        end
      end
      context 'with a Ruby Integer as input' do
        it 'returns an instance of SymEngine::Integer class' do
          a = Complex(2, 0)
          a = SymEngine::sympify(a)
          expect(a).to be_an_instance_of SymEngine::Integer
          expect(a.to_s).to eq('2')
        end
      end
      context 'Obtaining the integer real part' do
        it 'returns an instance of SymEngine::Integer class' do
          a = Complex(2, 7)
          a = SymEngine::S(a)
          a = a.real
          expect(a).to be_an_instance_of SymEngine::Integer
          expect(a.to_s).to eq('2');
        end
      end
      context 'Obtaining the integer imaginary part' do
        it 'returns an instance of SymEngine::Integer class' do
          a = Complex(2, 7)
          a = SymEngine::S(a)
          a = a.imaginary
          expect(a).to be_an_instance_of SymEngine::Integer
          expect(a.to_s).to eq('7');
        end
      end
      context 'Obtaining the rational real part ' do
        it 'returns an instance of SymEngine::Rational class' do
          a = Rational('5/4')
          a = Complex(a, 7)
          a = SymEngine::S(a)
          a = a.real
          expect(a).to be_an_instance_of SymEngine::Rational
          expect(a.to_s).to eq('5/4');
        end
      end
      context 'Obtaining the rational imaginary part' do
        it 'returns an instance of SymEngine::Integer class' do
          a = Rational('5/4')
          a = Complex(2, a)
          a = SymEngine::S(a)
          a = a.imaginary
          expect(a).to be_an_instance_of SymEngine::Rational
          expect(a.to_s).to eq('5/4');
        end
      end
    end
  end
end
