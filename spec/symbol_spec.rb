describe SymEngine::Symbol do
  describe '.new' do
    context 'with a string as an argument' do
      subject { SymEngine::Symbol.new('x') }
      it { is_expected.to be_a SymEngine::Symbol }
    end

    context 'with a Ruby symbol as an argument' do
      subject { SymEngine::Symbol.new(:x) }
      it { is_expected.to be_a SymEngine::Symbol }
    end
  end
end

describe SymEngine, '.symbols' do
  shared_examples 'two symbols' do
    subject(:symbols) { SymEngine.symbols(*args) }

    it { is_expected.to all be_a SymEngine::Symbol }
    its(:count) { is_expected.to eq 2 }
    it 'should have right names' do
      expect(symbols.map(&:to_s)).to eq %w[x y]
    end
  end

  context 'with a white-space separated string as an argument' do
    let(:args) { ['x y'] }

    it_behaves_like 'two symbols'
  end

  context 'with an array of Ruby Symbols as an argument' do
    let(:args) { [[:x, :y]] }

    it_behaves_like 'two symbols'
  end

  context 'with an array of Ruby Strings as an argument' do
    let(:args) { [%w[x y]] } # it would be one Array argument on *args

    it_behaves_like 'two symbols'
  end

  context 'with a splatted argument' do
    let(:args) { %w[x y] } # it would be several separate strings on *args

    it_behaves_like 'two symbols'
  end
end
