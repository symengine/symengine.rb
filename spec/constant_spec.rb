require 'spec_helper'

describe SymEngine do
  before :each do
  end

  describe 'Constant' do
    before :each do
      @a = SymEngine::PI
      @b = SymEngine::E
      @c = SymEngine::EULER_GAMMA
      @d = SymEngine::Integer.new(1);
      @e = SymEngine::Integer.new(0);
      @x = SymEngine::Symbol.new("x");
    end

    describe '#pi' do
      context 'with summation with one' do
        it 'returns an initialised Basic object that is equalent to 1 + pi' do
          f = @a + @d
          expect(@a).to be_a SymEngine::Constant
          expect(f).to be_a SymEngine::Basic
          expect(f.to_s).to eql('1 + pi')
        end
      end

      context 'with plus one and minus one' do
        it 'returns a Constant' do
          expect(1 + @a - 1).to be_a SymEngine::Constant
        end
      end

    end

    describe '#EulerGamma' do
      context 'with powered to zero' do
        it 'returns an initialised Basic object that is equalent 1' do
          f = @c ** @e
          expect(@c).to be_a SymEngine::Constant
          expect(f).to be_a SymEngine::Integer
          expect(f.to_s).to eql('1')
        end
      end

      context 'with plus one and minus one' do
        it 'returns a Constant' do
          expect(1 + @c - 1).to be_a SymEngine::Constant
        end
      end

    end

    describe '#E' do
      context 'with summation with x' do
        it 'returns an initialised Basic object that is equalent to x + E' do
          f = @b + @x
          expect(@b).to be_a SymEngine::Constant
          expect(f).to be_a SymEngine::Basic
          expect(f.to_s).to eql('x + E')
        end
      end

      context 'with plus one and minus one' do
        it 'returns a Constant' do
          expect(1 + @b - 1).to be_a SymEngine::Constant
        end
      end

    end

  end
end
