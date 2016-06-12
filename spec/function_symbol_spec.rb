describe SymEngine::FunctionSymbol do

  let(:x) { sym('x') }
  let(:y) { sym('y') }
  let(:z) { sym('z') }

  describe '.new' do
    context 'with symbols' do
      subject { SymEngine::FunctionSymbol.new('f', x, y, z) }
      it { is_expected.to be_a SymEngine::FunctionSymbol }
    end

    context 'with compound arguments' do
      subject { SymEngine::FunctionSymbol.new('f', 2*x, y, SymEngine::sin(z)) }
      it { is_expected.to be_a SymEngine::FunctionSymbol }
    end
  end
  
  context '#diff' do
    let(:fun) { (SymEngine::FunctionSymbol.new('f', 2*x, y, SymEngine::sin(z))) }
    context 'by variable' do
      subject { fun.diff(x)/2 }
      it { is_expected.to be_a SymEngine::Subs }
    end
  end
end


