describe SymEngine::Complex do
  context 'Convert to SymEngine types' do
    context 'with a Complex' do
      subject { SymEngine(Complex(2, 3)) }

      it { is_expected.to be_a SymEngine::Complex }
      its(:to_s) { is_expected.to eq '2 + 3*I' }
    end

    context 'with an integer' do
      subject { SymEngine(Complex(2, 0)) }

      it { is_expected.to be_a SymEngine::Integer }
      its(:to_s) { is_expected.to eq '2' }
    end
  end

  context 'real_part and imaginary_part' do
    let(:a) { SymEngine(Complex(Rational('2/7'), Rational('3/8'))) }
    let(:b) { SymEngine(Complex(2, 3)) }

    context 'real_part' do
      context 'using SymEngine Rationals' do
        subject { a.real }
        it { is_expected.to be_a SymEngine::Rational }
        its(:to_s) { is_expected.to eq '2/7' }
      end

      context 'using SymEngine Integers' do
        subject { b.real }
        it { is_expected.to be_a SymEngine::Integer }
        its(:to_s) { is_expected.to eq '2' }
      end
    end

    context 'imaginary_part' do
      context 'using SymEngine Rationals' do
        subject { a.imaginary }
        it { is_expected.to be_a SymEngine::Rational }
        its(:to_s) { is_expected.to eq '3/8' }
      end

      context 'using SymEngine Integers' do
        subject { b.imaginary }
        it { is_expected.to be_a SymEngine::Integer }
        its(:to_s) { is_expected.to eq '3' }
      end
    end 
  end
end

