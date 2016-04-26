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

    describe '#csc' do
      context 'calculation of csc pi div 2' do
        it 'returns one' do
          f = SymEngine::csc(@pi/2)
          expect(f).to eql(1)
        end
      end
    end

    describe '#sec' do
      context 'calculation of sec pi' do
        it 'returns minus one' do
          f = SymEngine::sec(@pi)
          expect(f).to eql(-1)
        end
      end
    end

    describe '#cot' do
      context 'calculation of cot pi div 4' do
        it 'returns one' do
          f = SymEngine::cot(@pi/4)
          expect(f).to eql(1)
        end
      end
    end

    describe '#asin' do
      context 'calculation of asin 1' do
        it 'returns pi div 2' do
          f = SymEngine::asin(1)
          expect(f).to eql(@pi/2)
        end
      end
    end

    describe '#acos' do
      context 'calculation of acos 1' do
        it 'returns zer0' do
          f = SymEngine::acos(1)
          expect(f).to eql(0)
        end
      end
    end

    describe '#atan' do
      context 'calculation of atan 1' do
        it 'returns pi div 4' do
          f = SymEngine::atan(1)
          expect(f).to eql(@pi/4)
        end
      end
    end

    describe '#acsc' do
      context 'calculation of acsc 1' do
        it 'returns pi div 2' do
          f = SymEngine::acsc(1)
          expect(f).to eql(@pi/2)
        end
      end
    end

    describe '#asec' do
      context 'calculation of asec 1' do
        it 'returns zero' do
          f = SymEngine::asec(1)
          expect(f).to eql(0)
        end
      end
    end

    describe '#acot' do
      context 'calculation of acot 1' do
        it 'returns pi div 4' do
          f = SymEngine::acot(1)
          expect(f).to eql(@pi/4)
        end
      end
    end

  end
end
