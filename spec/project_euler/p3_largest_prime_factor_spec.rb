# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143?
require 'prime'

def largest_prime(number)
  number.prime_division.map(&:first).max
end

describe "Problem 3: Largest prime factor" do

  describe "larget prime factor of 13195" do
    it { largest_prime(13195).should be_prime }
    it { largest_prime(13195).should eq 29 }
  end

  describe "larget prime factor of 600851475143" do
    it { largest_prime(600851475143).should be_prime }
    it { largest_prime(600851475143).should eq 6857 }
  end

end
