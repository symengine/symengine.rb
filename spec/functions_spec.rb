describe SymEngine, 'functions' do
  let(:pi) { SymEngine::PI }
  let(:e)  { SymEngine::E  }
  let(:x)  { sym("x")      }

  context '2*x' do
    [
      :sin, :cos, :tan, :csc, :sec, :cot,
      :asin, :acos, :atan, :acsc, :asec, :acot,
      :sinh, :cosh, :tanh, :csch, :sech, :coth,
      :asinh, :acosh, :atanh, :acsch, :asech, :acoth,
      :gamma, :dirichlet_eta].each do |fun|

      context "##{fun}" do
        let(:class_name) {
          f = fun.to_s
          if f.start_with?('a')
            f.sub(/^../) {|ls| ls.upcase }
          else
            f.capitalize
          end
        }
        let(:cls) { SymEngine.const_get(class_name) }
        subject { SymEngine.send(fun, 2 * x) }

        it { is_expected.to be_a cls }
        its(:to_s) { is_expected.to eq "#{fun}(2*x)" }
      end
    end

    context '#zeta' do
      subject { SymEngine.zeta(2 * x) }
      it { is_expected.to be_a SymEngine::Zeta }
      its(:to_s) { is_expected.to eq "zeta(2*x, 1)" }
    end

    context '#lambertw' do
      subject { SymEngine::lambertw(2 * x) }
      it { is_expected.to be_a SymEngine::LambertW }
      its(:to_s) { is_expected.to eq "lambertw(2*x)" }
    end
  end

  it 'calculates constants' do
    expect(SymEngine::sin(pi)).to eq(0)
    expect(SymEngine::cos(pi)).to eq(-1)
    expect(SymEngine::tan(pi)).to eq(0)
    expect(SymEngine::csc(pi/2)).to eq(1)
    expect(SymEngine::sec(pi)).to eq(-1)
    expect(SymEngine::cot(pi/4)).to eq(1)

    expect(SymEngine::asin(1)).to eq(pi/2)
    expect(SymEngine::acos(1)).to eq(0)
    expect(SymEngine::atan(1)).to eq(pi/4)
    expect(SymEngine::acsc(1)).to eq(pi/2)
    expect(SymEngine::asec(1)).to eq(0)
    expect(SymEngine::acot(1)).to eq(pi/4)

    expect(SymEngine::sinh(0)).to eq(0)
    expect(SymEngine::cosh(0)).to eq(1)
    expect(SymEngine::tanh(0)).to eq(0)
    expect(SymEngine::csch(1).to_s).to eq('csch(1)')
    expect(SymEngine::sech(0)).to eq(1)
    expect(SymEngine::coth(1).to_s).to eq('coth(1)')

    expect(SymEngine::asinh(0)).to eq(0)
    expect(SymEngine::acosh(1)).to eq(0)
    expect(SymEngine::atanh(0)).to eq(0)
    expect(SymEngine::acsch(1).to_s).to eq('log(1 + 2**(1/2))')
    expect(SymEngine::asech(1)).to eq(0)
    expect(SymEngine::acoth(1).to_s).to eq('acoth(1)')

    expect(SymEngine::lambertw(-e**(-1))).to eq(-1)
    expect(SymEngine::zeta(0)).to eq(-1.quo(2))
    expect(SymEngine::dirichlet_eta(1).to_s).to eq('log(2)')
    expect(SymEngine::gamma(1)).to eq(1)
  end
end
