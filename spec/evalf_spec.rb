describe 'SymEngine::evalf' do
    context 'RealDouble values' do
        subject { SymEngine::evalf(SymEngine::sin(SymEngine(2)), 53, true) }
        it { is_expected.to be_a SymEngine::RealDouble }
        it { is_expected.to be_within(0.000000000000001).of(0.909297426825682) }
    end
    if SymEngine::HAVE_MPFR
        context 'RealMPFR values' do
            subject { SymEngine::evalf(SymEngine::PI * SymEngine(1963319607) - SymEngine(6167950454), 100, true) }
            it { is_expected.to be_a SymEngine::RealMPFR }
            its(:to_s) { is_expected.to eq "1.4973429143989597928099399837265e-10" }
        end
    end
    context 'ComplexDouble values' do
        subject { SymEngine::evalf(SymEngine::sin(1) * SymEngine::I, 53, false) }
        it { is_expected.to  be_a SymEngine::ComplexDouble }
        its(:to_s) { is_expected.to eq "0.0 + 0.841470984807897*I" }
    end
    context 'ComplexMPC values' do
    
    end
    if SymEngine::HAVE_MPC
        context 'ComplexMPC values' do
            subject { SymEngine::evalf(SymEngine::sin(1) * SymEngine::I, 100, false) }
            it { is_expected.to  be_a SymEngine::ComplexMPC }
            its(:to_s) { is_expected.to eq "0.00000000000000000000000000000000 + 0.84147098480789650665250232163005*I" }
        end
    end
end
