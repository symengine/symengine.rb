describe SymEngine do
  describe 'ascii_art' do
    it 'should return a non-zero length string' do
      expect(SymEngine.ascii_art).to_not be_empty
    end
  end

  describe 'convert' do
    subject { SymEngine::convert(Complex(2, 3)) }

    it { is_expected.to be_a SymEngine::Complex }
    its(:to_s) { is_expected.to eq '2 + 3*I' }
  end

  describe 'SymEngine()' do
    subject { SymEngine(Rational('1/3')) }

    it { is_expected.to be_a SymEngine::Rational }
    its(:to_s) { is_expected.to eq '1/3' }
  end

end
