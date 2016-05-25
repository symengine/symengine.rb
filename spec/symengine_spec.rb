describe SymEngine do
  describe 'ascii_art' do
    it 'should return a non-zero length string' do
      expect(SymEngine.ascii_art).to_not be_empty
    end
  end
end
