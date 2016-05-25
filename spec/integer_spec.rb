describe SymEngine::Integer do
  describe '#initialize' do
    shared_examples 'simple integer check' do
      subject { SymEngine::Integer.new(value) }

      it { is_expected.to be_a SymEngine::Integer }
      its(:to_s) { is_expected.to eq value.to_s }
    end

    context 'positive Integer' do
      let(:value) { 123 }

      it_behaves_like 'simple integer check'
    end

    context 'negative Integer' do
      let(:value) { -123 }

      it_behaves_like 'simple integer check'
    end

    context 'huge positive Integer' do
      let(:value) { 12_345_678_912_345_678_912 }

      it_behaves_like 'simple integer check'
    end

    context 'huge negative Integer' do
      let(:value) { -12_345_678_912_345_678_912 }

      it_behaves_like 'simple integer check'
    end
  end

  describe 'coercion' do
    let(:symbol) { sym('x') }

    context 'using a ruby integer as the second operand' do
      context 'commutative operations' do
        subject { symbol * 2 }

        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(symbol * int(2)) }
      end

      context 'non commutative operations' do
        subject { symbol / 2 }

        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(symbol / int(2)) }
      end
    end

    context 'using a ruby integer as the first operand' do
      context 'commutative operations' do
        subject { 2 * symbol }

        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(symbol * int(2)) }
      end

      context 'non commutative operations' do
        subject { 2 / symbol }

        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(int(2) / symbol) }
      end
    end
  end
end
