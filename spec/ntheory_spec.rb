require 'spec_helper'

describe SymEngine do
  before :each do
  end

  describe 'NTheory' do

    describe '#gcd' do
      context 'GCD of 2 and 4' do
        it 'returns 2' do
          f = SymEngine::gcd(2, 4)
          expect(f).to eql(2)
        end
      end
    end

    describe '#lcm' do
      context 'LCM of 2 and 4' do
        it 'returns 4' do
          f = SymEngine::lcm(2, 4)
          expect(f).to eql(4)
        end
      end
    end

    describe '#nextprime' do
      context 'NextPrime after 4' do
        it 'returns 5' do
          f = SymEngine::nextprime(4)
          expect(f).to eql(5)
        end
      end
    end

    describe '#mod' do
      context '5 mod 4' do
        it 'returns 1' do
          f = SymEngine::mod(5, 4)
          expect(f).to eql(1)
        end
      end
      context '-5 mod -4' do
        it 'returns -1' do
          f = SymEngine::mod(-5, -4)
          expect(f).to eql(-1)
        end
      end
      context '5 mod -4' do
        it 'returns -3' do
          f = SymEngine::mod(5, -4)
          expect(f).to eql(-3)
        end
      end
      context '-5 mod 4' do
        it 'returns 3' do
          f = SymEngine::mod(-5, 4)
          expect(f).to eql(3)
        end
      end
    end

    describe '#quotient' do
      context 'quotient of 5 divided by 2' do
        it 'returns 2' do
          f = SymEngine::quotient(5, 2)
          expect(f).to eql(2)
        end
      end
    end

    describe '#fibonacci' do
      context '5th Fibonacci Number' do
        it 'returns 5' do
          f = SymEngine::fibonacci(5)
          expect(f).to eql(5)
        end
      end
    end

    describe '#lucas' do
      context '1st Lucas Number' do
        it 'returns 1' do
          f = SymEngine::fibonacci(1)
          expect(f).to eql(1)
        end
      end
    end
    
    describe '#binomial' do
      context 'binomial (n=5, k=1)' do
        it 'returns 5' do
          f = SymEngine::binomial(5, 1)
          expect(f).to eql(5)
        end
      end
    end

  end
end
