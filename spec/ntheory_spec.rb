describe SymEngine, 'NTheory' do
  let(:i1)  { int(1)  }
  let(:i4)  { int(4)  }
  let(:i5)  { int(5)  }
  let(:im4) { int(-4) }
  let(:im5) { int(-5) }

  it 'calculates #gcd' do
    expect(SymEngine::gcd(2, 4)).to eq 2
  end

  it 'caluclates #lcm' do
    expect(SymEngine::lcm(2, 4)).to eq(4)
  end

  it 'calculates #nextprime' do
    expect(SymEngine::nextprime(4)).to eq(5)
  end

  it 'calculates #%' do
    expect(i5 % i4).to eq(1)
    expect(im5 % im4).to eq(-1)
    expect(i5 % im4).to eq(-3)
    expect(im5 % i4).to eq(3)
  end

  it 'calculates #quotient' do
    expect(SymEngine::quotient(5, 2)).to eq(2)
  end

  it 'calculates #fibonacci' do
    expect(SymEngine::fibonacci(5)).to eq(5)
    expect(SymEngine::fibonacci(i5)).to eq(5)
  end

  it 'calculates #lucas' do
    expect(SymEngine::lucas(1)).to eq(1)
    expect(SymEngine::lucas(i1)).to eq(1)
  end

  it 'calculates #binomial' do
    expect(SymEngine::binomial(5, 1)).to eq(5)
    expect(SymEngine::binomial(i5, i1)).to eq(5)
  end
end
