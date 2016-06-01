describe SymEngine::RealDouble do
  describe 'Convert Float to Real Double' do
    shared_examples 'simple real check' do
      subject { SymEngine(value) }

      it { is_expected.to be_a SymEngine::RealDouble }
      its(:to_s) { is_expected.to eq value.to_s }
    end

    context 'positive Float' do
      let(:value) { 12.3 }

      it_behaves_like 'simple real check'
    end

    context 'negative Float' do
      let(:value) { -12.3 }

      it_behaves_like 'simple real check'
    end

    context 'huge positive float' do
      let(:value) { 1.12_345_678_912_345 }

      it_behaves_like 'simple real check'
    end

    context 'huge negative float' do
      let(:value) { -1.12_345_678_912_345 }

      it_behaves_like 'simple real check'
    end
  end

  describe 'coercion' do
    let(:symbol) { sym('x') }

    context 'using a ruby float as the second operand' do
      context 'commutative operations' do
        subject { symbol * 2.2 }

        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(symbol * SymEngine(2.2)) }
      end

      context 'non commutative operations' do
        subject { symbol / 2.2 }

        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(symbol / SymEngine(2.2)) }
      end
    end

    context 'using a ruby float as the first operand' do
      context 'commutative operations' do
        subject { 2.2 * symbol }

        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(symbol * SymEngine(2.2)) }
      end

      context 'non commutative operations' do
        subject { 2.2 / symbol }

        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(SymEngine(2.2) / symbol) }
      end
    end
  end
end
