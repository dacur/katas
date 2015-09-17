class Game
  attr_accessor :rolls_array

  def initialize
    @rolls_array = []
  end

  def roll(pins)
    if (new_game? || full_frame?) && rolls_array.length < 10
      @rolls_array << [pins]
    else
      @rolls_array.last << pins
    end
  end

  def score
    score_array = @rolls_array.each_with_index.map do |frame, index|
      if index < 9 
        if strike?(frame)
          if strike?(@rolls_array[index+1])
            20 + @rolls_array[index+2].first
          else
            10 + next_frame(index)
          end
        elsif spare?(frame) 
          10 + next_roll(index)
        else
          sum(frame)
        end
      else
        sum(frame)
      end
    end
    sum(score_array)
  end

  private

  def strike?(frame)
    frame == [10]
  end

  def spare?(frame)
    sum(frame) == 10
  end

  def next_roll(index)
    @rolls_array[index+1][0]
  end

  def next_frame(index)
    next_roll(index) + rolls_array[index+1][1]
  end

  def new_game?
    @rolls_array == []
  end

  def full_frame?
    @rolls_array.last.length == 2 || @rolls_array.last == [10]
  end

  def sum(a)
    a.inject(:+)
  end
end



