# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?
require 'prime'

Factor = Struct.new(:base, :power) do
  def self.to_proc
    ->(ary){ self.new *ary }
  end

  def to_power
    base**power
  end
end

def smallest_multiple(range)
  prime_divisors    = range.map(&:prime_division).flatten(1).map(&Factor)
  max_base_divisors = prime_divisors.group_by(&:base)
                                    .map{|_, factors| factors.max_by(&:power)}

  max_base_divisors.map(&:to_power).reduce(&:*)
end

describe "Problem 5: Smallest multiple" do

  describe "the smallest number that can be divided by each of the numbers " \
           "from 1 to 10 without any remainder" do
    it { smallest_multiple(1..10).should eq 2520 }
  end

  describe "the smallest number that can be divided by each of the numbers " \
           "from 1 to 20 without any remainder" do
    it { smallest_multiple(1..20).should eq 232792560 }
  end

end
