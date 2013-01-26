module Sequentially
  def below(limit, &block)
    enum = Enumerator.new do |y|
      each do |num|
        break unless num < limit
        y << num
      end
    end

    block ? enum.each(&block) : enum
  end

  def upto(limit, &block)
    enum = Enumerator.new do |y|
      each do |num|
        break if num > limit
        y << num
      end
    end

    block ? enum.each(&block) : enum
  end
end
