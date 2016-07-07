describe SymEngine::DenseMatrix do
  describe 'convert' do
    subject { SymEngine([[1, 2],[3, 4]]) }
    
    it { is_expected.to be_a SymEngine::DenseMatrix }
    its(:to_s) { is_expected.to eq "[1, 2]\n[3, 4]\n" }
  end
  
  describe 'dense_matrix inverse, FFLU, LU, LDL, FFLDU, det' do
    subject { SymEngine([[4, 3],[3, 2]]) }
    
    its(:inv) { is_expected.to be_a SymEngine::DenseMatrix }
    its(:inv) { is_expected.to eq SymEngine([[-2, 3],[3, -4]]) }
    
    its(:FFLU) { is_expected.to be_a SymEngine::DenseMatrix }
    its(:FFLU) { is_expected.to eq SymEngine([[4, 3],[3, -1]]) }
    
    its(:LU) { is_expected.to eq [SymEngine([[1, 0],[SymEngine(3)/SymEngine(4), 1]]), 
                                  SymEngine([[4, 3],[0, SymEngine(-1)/SymEngine(4)]])] }
                                  
    its(:LDL) { is_expected.to eq [SymEngine([[1, 0],[SymEngine(3)/SymEngine(4), 1]]), 
                                  SymEngine([[4, 0],[0, SymEngine(-1)/SymEngine(4)]])] }
    
    its(:FFLDU) { is_expected.to eq [SymEngine([[4, 0],[3, 1]]), SymEngine([[4, 0],[0, 4]]), 
                                     SymEngine([[4, 3],[0, -1]])] }
                                     
    its(:det) { is_expected.to eq (-1)}  
    
  end
  
      
  let(:mat1) { SymEngine([[1, 2],[3, 4]]) }
  let(:mat2) { SymEngine([[4, 3],[2, 1]]) }
  let(:a) { SymEngine(4) }
  let(:matA) { SymEngine([[3, 1, 2],[5, 7, 5], [1, 2, 3]]) }
  let(:b) { SymEngine([[4],[4],[4]]) }
    
  describe 'dense_matrix addition, multiplication' do
    
    it 'adds and multiplies' do
      expect(mat1 + mat2).to eq(SymEngine([[5, 5],[5, 5]]))
      expect(mat1 + a).to eq(SymEngine([[5, 6],[7, 8]]))
      expect(mat1 * mat2).to eq(SymEngine([[8, 5],[20, 13]]))
      expect(mat1 * a).to eq(SymEngine([[4, 8],[12, 16]]))
    end  
  end
  
  describe 'dense_matrix transpose and submatrix' do
    it 'performs transpose and submatrix' do
      expect(mat1.transpose).to eq(SymEngine([[1, 3],[2, 4]]))
      expect(mat1.submatrix(0, 0, 1, 0, 1, 1)).to eq(SymEngine([[1],[3]]))
    end
  end
  
  describe 'LU_solve' do
    it 'solves Ax = b' do
      expect(matA.LU_solve(b)).to eq(SymEngine([[SymEngine(12)/SymEngine(29)],
                                             [SymEngine(-32)/SymEngine(29)],
                                             [SymEngine(56)/SymEngine(29)]
                                             ]))  
    end
  end 

  describe 'getter and setter' do
    it 'gets and sets elements' do
      expect(mat1.set(0, 0, a)).to eq(SymEngine([[4, 2],[3, 4]]))
      expect(mat1.get(1, 0)).to eq(SymEngine(3))
    end
  end
  
  describe 'rows and cols' do
    it 'returns row and column count' do
      expect(matA.rows). to eq (3)
      expect(matA.cols). to eq (3)
    end
  end
  
end
