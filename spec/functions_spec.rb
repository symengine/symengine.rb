require 'spec_helper'

describe SymEngine do
  before :each do
  end

  describe 'Function' do
    before :each do
      @pi = SymEngine::PI
      @e = SymEngine::E
      @one = SymEngine::Integer.new(1)
      @zero = SymEngine::Integer.new(0)
      @two = SymEngine::Integer.new(2)
      @minone = SymEngine::Integer.new(-1)
      @x = SymEngine::Symbol.new("x");
    end

    describe '#sin' do
      context 'calculation of sin pi' do
        it 'returns zero' do
          f = SymEngine::sin(@pi)
          expect(f).to eql(0)
        end
      end
    end

    describe '#cos' do
      context 'calculation of cos pi' do
        it 'returns minus one' do
          f = SymEngine::cos(@pi)
          expect(f).to eql(-1)
        end
      end
    end

    describe '#tan' do
      context 'calculation of tan pi' do
        it 'returns zero' do
          f = SymEngine::tan(@pi)
          expect(f).to eql(0)
        end
      end
    end

  end
end
