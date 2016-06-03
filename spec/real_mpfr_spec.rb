require 'bigdecimal'

describe SymEngine::RealMPFR do
  describe 'Convert BigDemcimal to RealMPFR' do
    shared_examples 'simple real check' do
      subject { SymEngine(value) }

      it { is_expected.to be_a SymEngine::RealMPFR }
      its(:to_f) { is_expected.to eq value.to_f }
    end

    context 'positive BigDecimal' do
      let(:value) { BigDecimal("12.3") }

      it_behaves_like 'simple real check'
    end

    context 'negative BigDecimal' do
      let(:value) { BigDecimal("-12.3") }

      it_behaves_like 'simple real check'
    end
  end

  describe 'Initialize RealMPFR' do
    shared_examples 'simple real check' do
      subject { SymEngine::RealMPFR.new(value, 200) }

      it { is_expected.to be_a SymEngine::RealMPFR }
      its(:to_f) { is_expected.to eq value.to_f }
    end

    context 'positive BigDecimal' do
      let(:value) { BigDecimal("12.3") }

      it_behaves_like 'simple real check'
    end

    context 'negative BigDecimal' do
      let(:value) { BigDecimal("-12.3") }

      it_behaves_like 'simple real check'
    end

    context 'positive Float' do
      let(:value) { 12.3 }

      it_behaves_like 'simple real check'
    end

    context 'negative Float' do
      let(:value) { 12.3 }

      it_behaves_like 'simple real check'
    end

    context 'String representation of positive value' do
      let(:value) { "12.3" }

      it_behaves_like 'simple real check'
    end

    context 'String representation of negative value' do
      let(:value) { "-12.3" }

      it_behaves_like 'simple real check'
    end
  end


end
