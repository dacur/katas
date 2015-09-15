class Game
  attr_accessor :score_hash
  # [ [10], [5,3], [10], [9,1] ]

  def initialize
    @score_hash = []
  end

  def roll(pins)
    if pins != 10
      last = score_hash.last
      if @score_hash == []
        score_hash << [pins]
      elsif last.length == 2
        score_hash << [pins]
      else
        score_hash.last << pins
      end
    else
      score_hash << [10]
    end
  end

  def score
    score_hash.each_with_index.map do |s, index|
      if s == [10]
        # this frame plus next two frames
        10 + score_hash[index+1].sum + score_hash[index+2].sum
      elsif s.sum == 10
        # this frame plus next frame
        10 + score_hash[index+1].sum
      else
        # this frame only
        s.sum
      end
    end.sum
  end

end