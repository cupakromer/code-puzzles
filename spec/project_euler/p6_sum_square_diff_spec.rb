# The sum of the squares of the first ten natural numbers is,
#
#   1^2 + 2^2 + ... + 10^2 = 385
#
# The square of the sum of the first ten natural numbers is,
#
#   (1 + 2 + ... + 10)^2 = 55^2 = 3025
#
# Hence the difference between the sum of the squares of the first ten natural
# numbers and the square of the sum is 3025 - 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.
def sum_of_squares(natural_numbers)
  Array(natural_numbers).map{|n| n**2}.reduce(&:+)
end

def square_of_sum(natural_numbers)
  Array(natural_numbers).reduce(&:+)**2
end

def sum_square_difference(range)
  square_of_sum(range) - sum_of_squares(range)
end

describe "Problem 6: Sum square difference" do

  describe "difference between the sum of the squares of the first ten " \
           "natural numbers and the square of the sum" do
    it { sum_square_difference(1..10).should eq 2640 }
  end

  describe "difference between the sum of the squares of the first one " \
           "hundred natural numbers and the square of the sum" do
    it { sum_square_difference(1..100).should eq 25164150 }
  end

end
