class Game
  attr_accessor :score_hash
  # [ [10], [5,3], [10], [9,1], [6,1] ]
  # [18, 8, 20, 17, 7 ]

  def initialize
    @score_hash = []
  end

  def roll(pins)
    # byebug
    last = @score_hash.last
    if @score_hash.length >= 10
      @score_hash.last << pins
    elsif @score_hash == [] || last.length == 2 || last == [10]
      @score_hash << [pins]
    else
      @score_hash.last << pins
    end
  end

  def score
    score_array = @score_hash.each_with_index.map do |s, index|
      if index < 9 
        if s == [10]
          if @score_hash[index+1] == [10]
            # this is a double strike
            20 + @score_hash[index+2].first
          else
          # this is a single strike
            10 + @score_hash[index+1][0] + @score_hash[index+1][1]
          end
        elsif s.inject(:+) == 10
          # this frame plus next roll 
          10 + @score_hash[index+1].first
        else
          # this frame only
          s.inject(:+)
        end
      else
        s.inject(:+)
      end
    end

    # byebug
    score_array.inject(:+)
  end

end