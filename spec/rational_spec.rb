require 'spec_helper'

describe SymEngine do
  describe SymEngine::Rational do
    describe '.new' do
      context 'with a Ruby Rational object as input' do
        it 'returns an instance of SymEngine::Rational class' do
          a = Rational('2/3')
          a = SymEngine::sympify(a)
          expect(a).to be_a SymEngine::Rational
          expect(a.to_s).to eq('2/3')
        end
      end
      context 'with a Ruby Integer as input' do
        it 'returns an instance of SymEngine::Integer class' do
          a = Rational('2/1')
          a = SymEngine::sympify(a)
          expect(a).to be_a SymEngine::Integer
          expect(a.to_s).to eq('2')
        end
      end
      context 'with a Ruby Integer (x/x) as input' do
        it 'returns an instance of SymEngine::Integer class' do
          a = Rational('5/5')
          a = SymEngine::sympify(a)
          expect(a).to be_a SymEngine::Integer
          expect(a.to_s).to eq('1')
        end
      end
    end

    describe 'coercion tests' do
      before :each do
        @a = SymEngine::Symbol.new('x')
        @b = Rational(3, 5)
      end

      context 'using a ruby Rational as the second operand' do
        it 'succeeds with commutative operations' do
          c = @a * @b
          expect(c).to be_a SymEngine::Basic
          expect(c).to eq(SymEngine::Rational.new(@b) * @a)
        end

        it 'succeeds with non commutative operations' do
          c = @a / @b
          expect(c).to be_a SymEngine::Basic
          expect(c).to eq(@a / SymEngine::Rational.new(@b))
        end
      end

      context 'using a ruby Rational as the first operand' do
        it 'succeeds with commutative operations' do
          c = @b * @a
          expect(c).to be_a SymEngine::Basic
          expect(c).to eq(@a * SymEngine::Rational.new(@b))
        end

        it 'succeeds with non commutative operations' do
          c = @b / @a
          expect(c).to be_a SymEngine::Basic
          expect(c).to eq(SymEngine::Rational.new(@b) / @a)
        end
      end
    end
  end
end
