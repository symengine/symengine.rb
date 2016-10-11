describe 'SymEngine::evalf' do
  context 'RealDouble values' do
    subject { SymEngine.evalf(SymEngine.sin(SymEngine(2)), 53, true) }
    it { is_expected.to be_a SymEngine::RealDouble }
    it { is_expected.to be_within(1e-15).of(0.909297426825682) }
  end

  if SymEngine::HAVE_MPFR
    context 'RealMPFR values' do
      subject { SymEngine.evalf(SymEngine::PI * SymEngine(1_963_319_607) - SymEngine(6_167_950_454), 100, true) }
      it { is_expected.to be_a SymEngine::RealMPFR }
      it { is_expected.to be_within(SymEngine::RealMPFR.new('1e-41', 100)).of(SymEngine::RealMPFR.new('1.4973429143989597928099399837265e-10', 100)) }
    end
  end

  context 'ComplexDouble values' do
    subject { SymEngine.evalf(SymEngine.sin(1) * SymEngine::I, 53, false) }
    it { is_expected.to be_a SymEngine::ComplexDouble }
    its(:imaginary) { is_expected.to be_within(1e-15).of(0.841470984807897) }
  end

  if SymEngine::HAVE_MPC
    context 'ComplexMPC values' do
      subject { SymEngine.evalf(SymEngine.sin(1) * SymEngine::I, 100, false) }
      it { is_expected.to be_a SymEngine::ComplexMPC }
      its(:imaginary) { is_expected.to be_within(SymEngine::RealMPFR.new('1e-32', 100)).of(SymEngine::RealMPFR.new('0.84147098480789650665250232163005', 100)) }
    end
  end
end
