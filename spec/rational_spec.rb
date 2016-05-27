describe SymEngine::Rational do
  context '#initialize' do
    subject { SymEngine::Rational.new(Rational('2/3')) }

    it { is_expected.to be_a SymEngine::Rational }
    its(:to_s) { is_expected.to eq '2/3' }
  end

  context 'coercion' do
    let(:x) { sym('x') }
    let(:r) { Rational(3, 5) }

    context 'using a ruby Rational as the second operand' do
      context 'commutative operations' do
        subject { x * r }
        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(SymEngine::Rational.new(r) * x) }
      end

      context 'non commutative operations' do
        subject { x / r }
        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(x / SymEngine::Rational.new(r)) }
      end
    end

    context 'using a ruby Rational as the first operand' do
      context 'commutative operations' do
        subject { r * x }
        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(SymEngine::Rational.new(r) * x) }
      end

      context 'non commutative operations' do
        subject { r / x }
        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(SymEngine::Rational.new(r) / x) }
      end
    end
  end
end
