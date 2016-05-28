describe SymEngine::Basic do
  describe '.new' do
    subject { described_class.new }
    it { is_expected.to be_a SymEngine::Basic }
  end

  let(:x) { sym('x') }
  let(:y) { sym('y') }
  let(:z) { sym('z') }

  context 'binary operations' do
    expected_classes = {
      :+ => SymEngine::Add,
      :- => SymEngine::Add,

      :* => SymEngine::Mul,
      :/ => SymEngine::Mul,

      :** => SymEngine::Pow
    }

    # + and - have spaces around operator, while others haven't
    # That's a behavior of underlying library
    [:+, :-].each do |op|
      context "##{op}" do
        subject { x.send(op, y) }

        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to be_a expected_classes[op] }
        its(:to_s) { is_expected.to eq "x #{op} y" }
      end
    end

    [:*, :/, :**].each do |op|
      context "##{op}" do
        subject { x.send(op, y) }

        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to be_a expected_classes[op] }
        its(:to_s) { is_expected.to eq "x#{op}y" }
      end
    end

    context '#diff' do
      let(:fun) { (x**3) }
      context 'by variable' do
        subject { fun.diff(x) }

        it { is_expected.to be_a SymEngine::Basic }
        it { is_expected.to eq(3 * x**2) }
      end

      context 'by constant' do
        subject { fun.diff(2) }
        it { is_expected.to be_nil }
      end
    end

    context 'equality and inequality' do
      subject { x * y }
      it { is_expected.to eq sym('x')*sym('y') }
      it { is_expected.not_to eq sym('x')*sym('z') }
    end

    it 'simplifies' do
      expect(x + x).to eq(int(2) * x)
      expect(x + x).to eq(2 * x)
      expect(x * x).to eq(x**2)
      expect(x + y + x + x).to eq(3 * x + y)
      expect(x * y * x * x).to eq(x**3 * y)
      expect(x - x).to eq 0
      expect(2 * x - x).to eq x
      expect(3 * x - x).to eq 2 * x
      expect(2 * x * y - x * y).to eq x * y
      expect(x**y * x**x).to eq(x**(x + y))
      expect(x**y * x**x * x**z).to eq(x**(x + y + z))
      expect(x**y - x**y).to eq(0)
      expect(x**2 / x).to eq(x)
      expect(y * x**2 / (x * y)).to eq(x)
      expect((2 * x**3 * y**2 * z)**3 / 8).to eq(x**9 * y**6 * z**3)
      expect((2 * y**(-2 * x**2)) * (3 * y**(2 * x**2))).to eq(6)
      expect((x**2)**3).to eq(x**6)
    end

    it 'is reasonably commutative' do
      expect(x + y).to eq(y + x)
      expect(x * y).to eq(y * x)
      expect(x - y).not_to eq(y - x)
    end

    it 'raises on wrong args' do
      expect { 'x' * x }.to raise_error(TypeError)
    end
  end

  context 'unary operations' do
    context '#-@' do
      subject { -x }

      it { is_expected.to be_a SymEngine::Basic }
      its(:to_s) { is_expected.to eq '-x' }
    end
  end

  context 'formula meta-information' do
    let(:formula) { (x**y + z) }

    context '#args' do
      subject { formula.args }

      it { is_expected.to be_an Array }
      its(:size) { is_expected.to eq 2 }
      it { is_expected.to match_array [x**y, z] }
    end

    context '#free_symbols' do
      subject { formula.free_symbols }
      it { is_expected.to be_a Set }
      its(:size) { is_expected.to eq 3 }
      it { is_expected.to eq [x, y, z].to_set }
    end
  end

  describe '#expand' do
    let(:formula) { (x + y + z) * (x + y + z) }

    # Note let! -- formula is expanded immediately
    let!(:expanded) { formula.expand }
    subject { expanded }

    context 'original' do
      subject { formula }

      its(:to_s) { is_expected.to eq '(x + y + z)**2' }
    end

    context 'expanded' do
      it { is_expected.to be_a SymEngine::Basic }
      its(:to_s) { is_expected.to eq '2*x*y + 2*x*z + 2*y*z + x**2 + y**2 + z**2' }
      it { is_expected.not_to eq formula }
    end

    context 'square of sums' do
      let(:formula) { (x + y)**2 }

      it { is_expected.to eq(x**2 + 2 * x * y + y**2) }
      it { is_expected.to be_a SymEngine::Add }
    end

    it 'works for many different kinds of formulae' do
      expect(((2 * x + y)**2).expand).to eq(4 * x**2 + 4 * x * y + y**2)
      expect(((2 * x**2 + 3 * y)**2).expand).to eq(4 * x**4 + 12 * x**2 * y + 9 * y**2)
      expect(((2 * x / 3 + y / 4)**2).expand).to eq(4 * x**2 / 9 + x * y / 3 + y**2 / 16)
      expect(((1 / (y * z) - y * z) * y * z).expand).to eq(1 - (y * z)**2)
      expect(((1 / (x * y) - x * y + 2) * (1 + x * y)).expand).to eq(3 + 1 / (x * y) + x * y - (x * y)**2)
    end
  end

  describe '#subs' do
    let(:formula) { x + y + z }

    context 'with two basic objects as argument' do
      subject { formula.subs(x, y) }

      it {is_expected.to eq(2 * y + z) }
    end

    context 'with a Hash as argument' do
      context 'existing variables' do
        subject { formula.subs(x => y, z => y) }

        it { is_expected.to eq(3 * y) }
      end

      context 'new variable' do
        let(:k) { sym('k') }
        subject { formula.subs(x => k, y => k / 2, z => 2 * k) }

        it { is_expected.to eq((7 * k) / 2) }
      end
    end

    it 'fails on wrong arguments' do
      expect { formula.subs }.to raise_error(ArgumentError)
      expect { formula.subs(x, y, z) }.to raise_error(ArgumentError)
      expect { formula.subs(x) }.to raise_error(TypeError)
    end
  end
end
