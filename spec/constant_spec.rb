describe SymEngine, 'constants' do
  describe 'PI' do
    subject(:pi) { SymEngine::PI }

    it { is_expected.to be_a SymEngine::Constant }
    its(:to_s) { is_expected.to eq 'pi' }

    context 'sum with integer' do
      subject { int(1) + pi }

      its(:to_s) { is_expected.to eq '1 + pi' }
    end

    context 'with plus one and minus one' do
      subject { 1 + pi - 1 }

    it { is_expected.to be_a SymEngine::Constant }
    end
  end

  describe 'EULER_GAMMA' do
    subject(:euler_gamma) { SymEngine::EULER_GAMMA }

    it { is_expected.to be_a SymEngine::Constant }

    context 'with powered to zero' do
      subject { euler_gamma ** int(0) }

      it { is_expected.to be_a SymEngine::Integer }
      its(:to_s) { is_expected.to eq('1') }
    end
  end

  describe '#E' do
    subject(:e) { SymEngine::E }

    it { is_expected.to be_a SymEngine::Constant }

    context 'with summation with x' do
      subject { e + sym('x') }
      it { is_expected.to be_a SymEngine::Basic }
      its(:to_s) { is_expected.to eq 'x + E' }
    end
  end

  describe '#i' do
    subject(:i) { SymEngine::I }

    it { is_expected.to be_a SymEngine::Constant }

    context 'when squared' do
      subject { i * i}
      it { is_expected.to be_a SymEngine::Basic }
      its(:to_s) { is_expected.to eq '-1' }  
    end
  end

end
