# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.  Find the sum of all the
# multiples of 3 or 5 below 1000.

# Online Solution
upper_limit = 1000
(3...upper_limit).select{|n| 0 == n%3 || 0 == n%5}.reduce(&:+)

# Generator solution
require 'sequentially'

def multiples_of(*multiples)
  Enumerator.new do |y|
    a = 1
    loop do
      y << a if multiples.find{|n| 0 == a%n}
      a += 1
    end
  end.extend Sequentially
end

def sum_of_multiples_below(limit)
  multiples_of(3, 5).below(limit).reduce(&:+)
end

describe "Problem 1: Multiples of 3 and 5" do

  describe "sum of all multiples below 10" do
    it { sum_of_multiples_below(10).should eq 23 }
  end

  describe "sum of all multiples below 1000" do
    it { sum_of_multiples_below(1000).should eq 233168 }
  end

end
