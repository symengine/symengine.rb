describe 'SymEngine::lambdify' do
  
  let(:x) { SymEngine::Symbol.new('x') }
  let(:y) { SymEngine::Symbol.new('y') }
  let(:z) { SymEngine::Symbol.new('z') }
  
  describe 'lambda for Addition' do
    let(:func) { x + y + z }
    let(:lamb) { SymEngine::lambdify(func) }
    it 'performs addition with a lambda function' do
      expect(lamb.call(1, 1, 1)).to eq(3)
      expect(lamb.call(1, -1, 1)).to eq(1)
      expect(lamb.call(-1, -1, -1)).to eq(-3)
    end
  end
  
  describe 'lambda for Addition with FixNums' do
    let(:func) { x + 5}
    let(:lamb) { SymEngine::lambdify(func) }
    it 'performs addition with a lambda function' do
      expect(lamb.call(1)).to eq(6)
      expect(lamb.call(0)).to eq(5)
      expect(lamb.call(-1)).to eq(4)
      expect(lamb.call(Math::PI)).to be_within(0.000000000000001).of(8.141592653589793)
    end
  end
  
  describe 'lambda for sin' do
    let(:func) { SymEngine::sin(x) }
    let(:lamb) { SymEngine::lambdify(func) }
    it 'performs sin calculation with a lambda function' do
      expect(lamb.call(0)).to be_within(0.000000000000001).of(0.0)
      expect(lamb.call(Math::PI)).to be_within(0.000000000000001).of(0.0)
      expect(lamb.call(Math::PI/2)).to be_within(0.000000000000001).of(1.0)
    end
  end
  
end
