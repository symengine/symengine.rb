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
  
  describe 'parse' do
    subject { SymEngine::parse('123 + 321') }
    
    it { is_expected.to be_a SymEngine::Integer }
    it { is_expected.to eq 444 }
  end

  it 'gives parse errors' do
    expect { SymEngine::parse('12a + n34a9') }.to raise_error(RuntimeError)
  end
  
  describe 'parse an Add' do
    subject { SymEngine::parse('x + (y * 3 - 5)') }
    
    it { is_expected.to be_a SymEngine::Add }
  end
  
  describe 'parse a Pow' do
    subject { SymEngine::parse('x ** y') }
    
    it { is_expected.to be_a SymEngine::Pow }
  end
  
  describe 'parse rational values' do
    subject { SymEngine::parse('1 / 3 + 3 / 2') }
    
    it { is_expected.to eq SymEngine(11)/SymEngine(6) }
  end
  
  describe 'parse integer expressions' do
    subject { SymEngine::parse('1 + 2 * 2') }
    
    it { is_expected.to eq 5 }
  end
  
  describe 'parse trig functions' do
    subject { SymEngine::parse('sin(x) + cos(y) / 2') }
    
    it { is_expected.to be_a SymEngine::Add }
  end
  
  describe 'parse functions' do
    subject { SymEngine::parse('tan(0) - sqrt(2)') }
    
    it { is_expected.to be_a SymEngine::Mul }
  end

end
