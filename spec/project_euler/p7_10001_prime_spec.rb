# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.
#
# What is the 10 001st prime number?
require 'prime'

def nth_prime(n)
  Prime.take(n).last
end

describe "Problem 7: 10001st prime" do

  describe "The 6th prime" do
    it { nth_prime(6).should eq 13 }
  end

  describe "The 10001st prime" do
    it { nth_prime(10001).should eq 104743 }
  end

end
