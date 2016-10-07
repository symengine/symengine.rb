describe SymEngine::ComplexDouble do
  context 'Convert to SymEngine types' do
    context 'with a Complex' do
      subject { SymEngine(Complex(2.3, 3.2)) }

      it { is_expected.to be_a SymEngine::ComplexDouble }
      its(:to_s) { is_expected.to eq '2.3 + 3.2*I' }
    end

    context 'with an integer' do
      subject { SymEngine(Complex(2.3, 0)) }

      it { is_expected.to be_a SymEngine::RealDouble }
      its(:to_s) { is_expected.to eq '2.3' }
    end
  end

  context 'real_part and imaginary_part' do
    let(:a) { SymEngine(Complex(2.3, 3.2)) }

    context 'real_part' do
      context 'using SymEngine RealDoubles' do
        subject { a.real }
        it { is_expected.to be_a SymEngine::RealDouble }
        its(:to_s) { is_expected.to eq '2.3' }
      end
    end

    context 'imaginary_part' do
      context 'using SymEngine RealDoubles' do
        subject { a.imaginary }
        it { is_expected.to be_a SymEngine::RealDouble }
        its(:to_s) { is_expected.to eq '3.2' }
      end
    end
  end
end
