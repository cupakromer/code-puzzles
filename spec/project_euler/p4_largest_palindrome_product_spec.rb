# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
class String
  def palindrome?
    self == reverse
  end
end

class Fixnum
  def palindrome?
    to_s.palindrome?
  end
end

def products(range, n_elements = 2)
  range.to_a.repeated_combination(n_elements).map{|nums| nums.reduce(:*)}.uniq
end

def largest_palindrome_from_product(range)
  products(range).select(&:palindrome?).max
end

describe "Problem 4: Largest palindrome product" do

  describe "largest palindrome made from the product of two 2-digit numbers" do
    it { largest_palindrome_from_product(10...100).should eq 9009 }
  end

  describe "largest palindrome made from the product of two 3-digit numbers" do
    it { largest_palindrome_from_product(100...1000).should eq 906609 }
  end

end
