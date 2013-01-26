# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.
require 'prime'
require 'sequentially'

def sum_of_primes_below(limit)
  prime_generator = Prime.each.extend Sequentially
  prime_generator.below(limit).reduce(&:+)
end

describe "Problem 10: Summation of primes" do

  describe "sum of primes below 10" do
    it { sum_of_primes_below(10).should eq 17 }
  end

  describe "sum of primes below 2_000_000" do
    it { sum_of_primes_below(2_000_000).should eq 142913828922 }
  end

end
