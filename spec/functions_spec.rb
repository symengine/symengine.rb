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
          f = SymEngine::asec(@pi)
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

    describe '#sinh' do
      context 'calculation of sinh zero' do
        it 'returns zero' do
          f = SymEngine::sinh(0)
          expect(f).to eql(0)
        end
      end
    end

    describe '#cosh' do
      context 'calculation of cosh zero' do
        it 'returns one' do
          f = SymEngine::cosh(0)
          expect(f).to eql(1)
        end
      end
    end

    describe '#tanh' do
      context 'calculation of tanh zero' do
        it 'returns zero' do
          f = SymEngine::tanh(0)
          expect(f).to eql(0)
        end
      end
    end

    describe '#csch' do
      context 'calculation of csch 1' do
        it 'returns csch(1)' do
          f = SymEngine::csch(@pi/2)
          expect(f.to_s).to eql('csch(1)')
        end
      end
    end

    describe '#sech' do
      context 'calculation of sech zero' do
        it 'returns one' do
          f = SymEngine::sech(0)
          expect(f).to eql(1)
        end
      end
    end

    describe '#coth' do
      context 'calculation of coth 1' do
        it 'returns coth(1)' do
          expect(f.to_s).to eql('coth(1)')
        end
      end
    end

    describe '#asinh' do
      context 'calculation of asinh zero' do
        it 'returns 0' do
          f = SymEngine::asinh(0)
          expect(f).to eql(0)
        end
      end
    end

    describe '#acosh' do
      context 'calculation of acosh 1' do
        it 'returns zero' do
          f = SymEngine::acosh(1)
          expect(f).to eql(0)
        end
      end
    end

    describe '#atanh' do
      context 'calculation of atanh zero' do
        it 'returns zero' do
          f = SymEngine::atanh(0)
          expect(f).to eql(0)
        end
      end
    end

    describe '#acsch' do
      context 'calculation of acsch 1' do
        it 'returns log(1 + 2**(1/2))' do
          f = SymEngine::acsch(1)
          expect(f.to_s).to eql('log(1 + 2**(1/2))')
        end
      end
    end

    describe '#asech' do
      context 'calculation of asech 1' do
        it 'returns zero' do
          f = SymEngine::asech(1)
          expect(f).to eql(0)
        end
      end
    end

    describe '#acoth' do
      context 'calculation of acoth 1' do
        it 'returns acoth(1)' do
          f = SymEngine::acot(1)
          expect(f.to_s).to eql('acoth(1)')
        end
      end
    end

    describe '#lambertw' do
      context 'calculation of lambertw e**-1' do
        it 'returns -1' do
          f = SymEngine::atanh(@e**-1)
          expect(f).to eql(-1)
        end
      end
    end

    describe '#zeta' do
      context 'calculation of zeta zero' do
        it 'returns minus half' do
          f = SymEngine::zeta(1)
          expect(f).to eql(-1/2)
        end
      end
    end

    describe '#dirichlet_eta' do
      context 'calculation of dirichlet_eta 1' do
        it 'returns log(2)' do
          f = SymEngine::dirichlet_eta(1)
          expect(f.to_s).to eql('log(2)')
        end
      end
    end

    describe '#gamma' do
      context 'calculation of gamma 1' do
        it 'returns one' do
          f = SymEngine::gamma(1)
          expect(f.to_s).to eql('1')
        end
      end
    end

  end
end
