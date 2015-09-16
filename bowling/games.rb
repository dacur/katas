class Game
  attr_accessor :score_hash

  def initialize
    @score_hash = []
  end

  def roll(pins)
    last = @score_hash.last
    if (@score_hash == [] || last.length == 2 || last == [10]) && score_hash.length < 10
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
        elsif sum(s) == 10
          # this frame plus next roll 
          10 + @score_hash[index+1].first
        else
          # this frame only
          sum(s)
        end
      else
        sum(s)
      end
    end
    sum(score_array)
  end

  private

  def sum(a)
    a.inject(:+)
  end
end