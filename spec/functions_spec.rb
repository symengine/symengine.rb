require 'spec_helper'

describe SymEngine do
  before :each do
  end

  describe 'Function' do
    before :each do
      @pi = SymEngine::PI
      @e = SymEngine::E
      @x = SymEngine::Symbol.new("x");
    end

    describe '#sin' do
      context 'calculation of sin pi' do
        it 'returns zero' do
          f = SymEngine::sin(@pi)
          expect(f).to eql(0)
        end
      end
      context 'sin(2x)' do
        it 'is an instance of sin' do
          f = SymEngine::sin(2*@x)
          expect(f).to be_an_instance_of SymEngine::Sin
          expect(f.to_s).to eql("sin(2*x)")
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
      context 'cos(2x)' do
        it 'is an instance of cos' do
          f = SymEngine::cos(2*@x)
          expect(f).to be_an_instance_of SymEngine::Cos
          expect(f.to_s).to eql("cos(2*x)")
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
      context 'tan(2x)' do
        it 'is an instance of tan' do
          f = SymEngine::tan(2*@x)
          expect(f).to be_an_instance_of SymEngine::Tan
          expect(f.to_s).to eql("tan(2*x)")
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
      context 'csc(2x)' do
        it 'is an instance of csc' do
          f = SymEngine::csc(2*@x)
          expect(f).to be_an_instance_of SymEngine::Csc
          expect(f.to_s).to eql("csc(2*x)")
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
      context 'sec(2x)' do
        it 'is an instance of sec' do
          f = SymEngine::sec(2*@x)
          expect(f).to be_an_instance_of SymEngine::Sec
          expect(f.to_s).to eql("sec(2*x)")
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
      context 'cot(2x)' do
        it 'is an instance of cot' do
          f = SymEngine::cot(2*@x)
          expect(f).to be_an_instance_of SymEngine::Cot
          expect(f.to_s).to eql("cot(2*x)")
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
      context 'asin(2x)' do
        it 'is an instance of asin' do
          f = SymEngine::asin(2*@x)
          expect(f).to be_an_instance_of SymEngine::ASin
          expect(f.to_s).to eql("asin(2*x)")
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
      context 'acos(2x)' do
        it 'is an instance of acos' do
          f = SymEngine::acos(2*@x)
          expect(f).to be_an_instance_of SymEngine::ACos
          expect(f.to_s).to eql("acos(2*x)")
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
      context 'atan(2x)' do
        it 'is an instance of atan' do
          f = SymEngine::atan(2*@x)
          expect(f).to be_an_instance_of SymEngine::ATan
          expect(f.to_s).to eql("atan(2*x)")
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
      context 'acsc(2x)' do
        it 'is an instance of acsc' do
          f = SymEngine::acsc(2*@x)
          expect(f).to be_an_instance_of SymEngine::ACsc
          expect(f.to_s).to eql("acsc(2*x)")
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
      context 'asec(2x)' do
        it 'is an instance of asec' do
          f = SymEngine::asec(2*@x)
          expect(f).to be_an_instance_of SymEngine::ASec
          expect(f.to_s).to eql("asec(2*x)")
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
      context 'acot(2x)' do
        it 'is an instance of acot' do
          f = SymEngine::acot(2*@x)
          expect(f).to be_an_instance_of SymEngine::ACot
          expect(f.to_s).to eql("acot(2*x)")
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
      context 'sinh(2x)' do
        it 'is an instance of sinh' do
          f = SymEngine::sinh(2*@x)
          expect(f).to be_an_instance_of SymEngine::Sinh
          expect(f.to_s).to eql("sinh(2*x)")
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
      context 'cosh(2x)' do
        it 'is an instance of cosh' do
          f = SymEngine::cosh(2*@x)
          expect(f).to be_an_instance_of SymEngine::Cosh
          expect(f.to_s).to eql("cosh(2*x)")
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
      context 'tanh(2x)' do
        it 'is an instance of tanh' do
          f = SymEngine::tanh(2*@x)
          expect(f).to be_an_instance_of SymEngine::Tanh
          expect(f.to_s).to eql("tanh(2*x)")
        end
      end
    end

    describe '#csch' do
      context 'calculation of csch 1' do
        it 'returns csch(1)' do
          f = SymEngine::csch(1)
          expect(f.to_s).to eql('csch(1)')
        end
      end
      context 'csch(2x)' do
        it 'is an instance of csch' do
          f = SymEngine::csch(2*@x)
          expect(f).to be_an_instance_of SymEngine::Csch
          expect(f.to_s).to eql("csch(2*x)")
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
      context 'sech(2x)' do
        it 'is an instance of sech' do
          f = SymEngine::sech(2*@x)
          expect(f).to be_an_instance_of SymEngine::Sech
          expect(f.to_s).to eql("sech(2*x)")
        end
      end
    end

    describe '#coth' do
      context 'calculation of coth 1' do
        it 'returns coth(1)' do
          f = SymEngine::coth(1)
          expect(f.to_s).to eql('coth(1)')
        end
      end
      context 'coth(2x)' do
        it 'is an instance of coth' do
          f = SymEngine::coth(2*@x)
          expect(f).to be_an_instance_of SymEngine::Coth
          expect(f.to_s).to eql("coth(2*x)")
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
      context 'asinh(2x)' do
        it 'is an instance of asinh' do
          f = SymEngine::asinh(2*@x)
          expect(f).to be_an_instance_of SymEngine::ASinh
          expect(f.to_s).to eql("asinh(2*x)")
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
      context 'acosh(2x)' do
        it 'is an instance of acosh' do
          f = SymEngine::acosh(2*@x)
          expect(f).to be_an_instance_of SymEngine::ACosh
          expect(f.to_s).to eql("acosh(2*x)")
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
      context 'atanh(2x)' do
        it 'is an instance of atanh' do
          f = SymEngine::atanh(2*@x)
          expect(f).to be_an_instance_of SymEngine::ATanh
          expect(f.to_s).to eql("atanh(2*x)")
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
      context 'acsch(2x)' do
        it 'is an instance of acsch' do
          f = SymEngine::acsch(2*@x)
          expect(f).to be_an_instance_of SymEngine::ACsch
          expect(f.to_s).to eql("acsch(2*x)")
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
      context 'asech(2x)' do
        it 'is an instance of asech' do
          f = SymEngine::asech(2*@x)
          expect(f).to be_an_instance_of SymEngine::ASech
          expect(f.to_s).to eql("asech(2*x)")
        end
      end
    end

    describe '#acoth' do
      context 'calculation of acoth 1' do
        it 'returns acoth(1)' do
          f = SymEngine::acoth(1)
          expect(f.to_s).to eql('acoth(1)')
        end
      end
      context 'acoth(2x)' do
        it 'is an instance of acoth' do
          f = SymEngine::acoth(2*@x)
          expect(f).to be_an_instance_of SymEngine::ACoth
          expect(f.to_s).to eql("acoth(2*x)")
        end
      end
    end

    describe '#lambertw' do
      context 'calculation of lambertw -e**-1' do
        it 'returns -1' do
          f = SymEngine::lambertw(-@e**(-1))
          expect(f).to eql(-1)
        end
      end
      context 'lambertw(2x)' do
        it 'is an instance of lambertw' do
          f = SymEngine::lambertw(2*@x)
          expect(f).to be_an_instance_of SymEngine::LambertW
          expect(f.to_s).to eql("lambertw(2*x)")
        end
      end
    end

    describe '#zeta' do
      context 'calculation of zeta zero' do
        it 'returns minus half' do
          f = SymEngine::zeta(0)
          r = -1.quo(2)
          expect(f).to eql(r)
        end
      end
      context 'zeta(2x)' do
        it 'is an instance of zeta' do
          f = SymEngine::zeta(2*@x)
          expect(f).to be_an_instance_of SymEngine::Zeta
          expect(f.to_s).to eql("zeta(2*x, 1)")
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
      context 'dirichlet_eta(2x)' do
        it 'is an instance of dirichlet_eta' do
          f = SymEngine::dirichlet_eta(2*@x)
          expect(f).to be_an_instance_of SymEngine::Dirichlet_eta
          expect(f.to_s).to eql("dirichlet_eta(2*x)")
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
      context 'gamma(2x)' do
        it 'is an instance of gamma' do
          f = SymEngine::gamma(2*@x)
          expect(f).to be_an_instance_of SymEngine::Gamma
          expect(f.to_s).to eql("gamma(2*x)")
        end
      end
    end

  end
end
