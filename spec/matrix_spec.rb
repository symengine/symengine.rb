describe SymEngine::DenseMatrix do
  describe 'convert' do
    subject { SymEngine([[1, 2],[3, 4]]) }
    
    it { is_expected.to be_a SymEngine::DenseMatrix }
    its(:to_s) { is_expected.to eq "[1, 2]\n[3, 4]\n" }
  end
  
  describe 'dense_matrix functions' do
    subject { SymEngine([[4, 3],[3, 2]]) }
    
    its(:inv) { is_expected.to be_a SymEngine::DenseMatrix }
    its(:inv) { is_expected.to eq SymEngine([[-2, 3],[3, -4]]) }
    
    its(:FFLU) { is_expected.to be_a SymEngine::DenseMatrix }
    its(:FFLU) { is_expected.to eq SymEngine([[4, 3],[3, -1]]) }
    
    #its(:LU) { is_expected.to eq [SymEngine([[1, 0],[3/4, 1]]), SymEngine([[4, 3],[0, -1/4]])] }
    
    
  end
  
end
