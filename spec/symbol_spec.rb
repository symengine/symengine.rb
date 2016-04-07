require 'spec_helper'



describe SymEngine do
  before :each do
  end

  describe '.symbols' do
    before :all do

      # Create a shortcut Proc to DRY up code.
      #
      # Call this with the number of symbols we expect to get out
      # and the argument we want to provide it.
      @test_symbols_method = Proc.new do |count_symbols, *args|
        symbols = SymEngine.symbols(*args)
        symbols.each do |symbol|
          expect(symbol).to be_an_instance_of SymEngine::Symbol
        end
        expect(symbols.size).to eql(count_symbols)
      end
    end

    context 'with a white-space separated string as an argument' do
      it 'returns an Enumerable of Symbol objects' do
        @test_symbols_method.call(2, 'x y')
      end
    end

    context 'with an array of Ruby Symbols as an argument' do
      it 'returns an Enumerable of Symbol objects' do
        # @test_symbols_method.call(2, %i{x y}) # Ruby 2.0 and higher only
        @test_symbols_method.call(2, [:x, :y])
      end
    end

    context 'with an array of Ruby Strings as an argument' do
      it 'returns an Enumerable of Symbol objects' do
        @test_symbols_method.call(2, %w{x y})
      end
    end

    context 'with a splatted argument' do
      it 'returns an Enumerable of Symbol objects' do
        @test_symbols_method.call(2, 'x', 'y')
      end
    end
  end

  describe SymEngine::Symbol do
    before :each do
    end

    describe '.new' do
      context 'with a string as an argument' do
        it 'returns a Symbol object' do
          symbol = SymEngine::Symbol.new('x')
          expect(symbol).to be_an_instance_of SymEngine::Symbol
        end
      end

      context 'with a Ruby symbol as an argument' do
        it 'returns a Symbol object' do
          symbol = SymEngine::Symbol.new(:x)
          expect(symbol).to be_an_instance_of SymEngine::Symbol
        end
      end
    end
  end
end
