# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
#
#   a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
def triplets_of_sum(sum)
  a, b = 1, 2

  (1..(sum/3)).each_with_object([]) do |a, triplets|
    b, limit = a + 1, (sum - a) / 2
    break triplets if b > limit
    (b..limit).each do |b|
      c = sum - a - b
      triplets << [a, b, c] if c**2 == (a**2 + b**2)
    end
  end
end

def product_of_triplets_of_sum(sum)
  triplets_of_sum(sum).map{|triplet| triplet.reduce(&:*)}
end

describe "Problem 9: Special Pythagorean triplet" do

  describe "Product of triplet which sums to 12" do
    it { triplets_of_sum(12).should match_array [[3, 4, 5]] }
    it { product_of_triplets_of_sum(12).should eq [60] }
  end

  describe "Product of triplet which sums to 1000" do
    it { triplets_of_sum(1000).should match_array [[200, 375, 425]] }
    it { product_of_triplets_of_sum(1000).should eq [31875000] }
  end

end
