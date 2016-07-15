describe 'SymEngine::lambdify_code' do
  
  let(:x) { SymEngine::Symbol.new('x') }
  let(:y) { SymEngine::Symbol.new('y') }
  let(:z) { SymEngine::Symbol.new('z') }
  
  def l(code)
    SymEngine::Utils::lambdify_code(code)
  end
  
  it 'creates lambda codes' do
    expect(l( x + y + z )).to eq("lambda { | x,y,z | x + y + z }")
    expect(l( x + 5 )).to eq("lambda { | x | Rational(5,1) + x }")
    expect(l( SymEngine::sin(x) )).to eq("lambda { | x | Math.sin(x) }")
    expect(l( SymEngine::cos(x) )).to eq("lambda { | x | Math.cos(x) }")
    expect(l( SymEngine::tan(x) )).to eq("lambda { | x | Math.tan(x) }")
    expect(l( SymEngine::asin(x) )).to eq("lambda { | x | Math.asin(x) }")
    expect(l( SymEngine::acos(x) )).to eq("lambda { | x | Math.acos(x) }")
    expect(l( SymEngine::atan(x) )).to eq("lambda { | x | Math.atan(x) }")
    expect(l( SymEngine::sinh(x) )).to eq("lambda { | x | Math.sinh(x) }")
    expect(l( SymEngine::cosh(x) )).to eq("lambda { | x | Math.cosh(x) }")
    expect(l( SymEngine::tanh(x) )).to eq("lambda { | x | Math.tanh(x) }")
    expect(l( SymEngine::asinh(x) )).to eq("lambda { | x | Math.asinh(x) }")
    expect(l( SymEngine::acosh(x) )).to eq("lambda { | x | Math.acosh(x) }")
    expect(l( SymEngine::atanh(x) )).to eq("lambda { | x | Math.atanh(x) }")
    expect(l( SymEngine::gamma(x) )).to eq("lambda { | x | Math.gamma(x) }")
    expect(l( x + SymEngine::PI )).to eq("lambda { | x | x + Math::PI }")
    expect(l( x + SymEngine::E )).to eq("lambda { | x | x + Math::E }")
    expect(l( SymEngine::dirichlet_eta(x) )).to eq("lambda { | x | SymEngine::Utils::evalf_dirichlet_eta(x) }")
    expect(l( SymEngine::zeta(x) )).to eq("lambda { | x | SymEngine::Utils::evalf_zeta(x, Rational(1,1)) }")
    
    
  end
end

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
      expect(lamb.call(Math::PI)).to be_within(1e-15).of(8.141592653589793)
    end
  end
  
  describe 'lambda for sin' do
    let(:func) { SymEngine::sin(x) }
    let(:lamb) { SymEngine::lambdify(func) }
    it 'performs sin calculation with a lambda function' do
      expect(lamb.call(0)).to be_within(1e-15).of(0.0)
      expect(lamb.call(Math::PI)).to be_within(1e-15).of(0.0)
      expect(lamb.call(Math::PI/2)).to be_within(1e-15).of(1.0)
    end
  end
  
end
