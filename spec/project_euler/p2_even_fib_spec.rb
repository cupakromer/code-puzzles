# Each new term in the Fibonacci sequence is generated by adding the previous
# two terms. By starting with 1 and 2, the first 10 terms will be:
#
#   1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#
# By considering the terms in the Fibonacci sequence whose values do not exceed
# four million, find the sum of the even-valued terms.
require 'sequentially'

def sum_of_even_fibonacci_upto(limit)
  fib = Enumerator.new do |y|
    a = b = 1
    loop do
      y << a
      a, b = b, a + b
    end
  end.extend Sequentially

  fib.upto(limit).select(&:even?).reduce(&:+)
end

describe "Problem 2: Even Fibonacci numbers" do

  describe "the sum of even Fibonacci numbers which do not exceed four million" do
    it { sum_of_even_fibonacci_upto(4_000_000).should eq 4613732 }
  end

end