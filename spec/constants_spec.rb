require 'spec_helper'

describe SymEngine do
  before :each do
  end

  describe 'Constants' do
    before :each do
      @a = SymEngine::PI
      @b = SymEngine::E
      @c = SymEngine::EulerGamma
      @d = SymEngine::Integer.new(1);
      @e = SymEngine::Integer.new(0);
      @x = SymEngine::Symbol.new("x");
    end

    describe '#pi' do
      context 'with summation with one' do
        it 'returns an initialised Basic object that is equalent to 1 + pi' do
          f = @a + @d
          expect(f).to be_an_instance_of SymEngine::Basic
          expect(f.to_s).to eql('1 + pi')
        end
      end
    end

    describe '#EulerGamma' do
      context 'with powered to zero' do
        it 'returns an initialised Basic object that is equalent 1' do
          f = @c ** @e
          expect(f).to be_an_instance_of SymEngine::Integer
          expect(f.to_s).to eql('1')
        end
      end
    end

    describe '#E' do
      context 'with summation with x' do
        it 'returns an initialised Basic object that is equalent to x + E' do
          f = @b + @x
          expect(f).to be_an_instance_of SymEngine::Basic
          expect(f.to_s).to eql('x + E')
        end
      end
    end

  end
end
