require 'spec_helper'

describe SymEngine do
  describe 'ascii_art' do
    it 'should return a non-zero length string' do
      assert SymEngine.ascii_art.length > 0
    end
  end
end
