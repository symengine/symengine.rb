describe SymEngine::Rational do
  context 'Convert to SymEngine types' do
    context 'with a Rational' do
      subject { SymEngine(Rational('2/3')) }

      it { is_expected.to be_a SymEngine::Rational }
      its(:to_s) { is_expected.to eq '2/3' }
    end

    context 'with an integer' do
      subject { SymEngine(Rational('2/1')) }

      it { is_expected.to be_a SymEngine::Integer }
      its(:to_s) { is_expected.to eq '2' }
    end

    context 'with one (x/x)' do
      subject { SymEngine(Rational('44/44')) }

      it { is_expected.to be_a SymEngine::Integer }
      its(:to_s) { is_expected.to eq '1' }
    end
  end

  context 'coercion' do
    let(:x) { sym('x') }
    let(:r) { Rational(3, 5) }

    context 'using a ruby Rational as the second operand' do
      context 'commutative operations' do
        subject { x * r }
        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(SymEngine(r) * x) }
      end

      context 'non commutative operations' do
        subject { x / r }
        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(x / SymEngine(r)) }
      end
    end

    context 'using a ruby Rational as the first operand' do
      context 'commutative operations' do
        subject { r * x }
        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(SymEngine(r) * x) }
      end

      context 'non commutative operations' do
        subject { r / x }
        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(SymEngine(r) / x) }
      end
    end
  end
end
