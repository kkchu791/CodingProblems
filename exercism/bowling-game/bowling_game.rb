class BowlingGame
  attr_reader :rolls
  def initialize
    @rolls = []
  end

  def roll(pins)
    rolls << pins
  end

  def score
    result = 0
    rolls_index = 0
    10.times do
      if strike?(rolls_index)
        result += strike_score(rolls_index)
        rolls_index += 1
      elsif spare?(rolls_index)
        result += spare_score(rolls_index)
        rolls_index += 2
      else
        result += frame_score(rolls_index)
        rolls_index += 2
      end
    end
    result
  end

  def spare?(rolls_index)
    rolls[rolls_index] + (rolls[rolls_index + 1] || 0) == 10
  end

  def strike?(rolls_index)
    rolls[rolls_index] == 10
  end

  def spare_score(rolls_index)
    10 + rolls[rolls_index + 2]
  end

  def strike_score(rolls_index)
    10 + rolls[rolls_index + 1] + rolls[rolls_index + 2]
  end

  def frame_score(rolls_index)
    rolls[rolls_index] + (rolls[rolls_index + 1] || 0)
  end

end
