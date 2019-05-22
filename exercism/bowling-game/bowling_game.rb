class BowlingGame
  attr_reader :rolls
  def initialize
    @rolls = []
  end

  def roll(pins)
    rolls << pins
  end

  def score
    res = 0

    @rolls.each_with_index do |frame_score, index|
      if strike?(frame_score)
        res += strike_score(frame_score, index)
      elsif spare?(frame_score)
        res += spare_score(frame_score, index)
      else
        res += frame_score[0] + frame_score[1]
      end
    end

    res
  end

  def strike?(frame_score)
    frame_score.include?('X')
  end

  def spare?(frame_score)
    frame_score.include?('/')
  end

  def next_frame(index)
    @rolls[index + 1]
  end

  def next_roll(index)
    @rolls[index + 1] ? @rolls[index + 1][0] : 0
  end

  def next_frame_next_roll(index)
    @rolls[index + 2] ? @rolls[index + 2][0] : 10
  end


  def strike_score(frame_score, index)
    extra_points = 0

    if next_frame(index).nil?
      return 30
    end

    if strike?(next_frame(index))
      extra_points += next_frame_next_roll(index) == 'X' ? 10 : next_frame_next_roll(index)
      extra_points += 10
    elsif next_frame(index).include?('/')
      extra_points += 10
    else
      extra_points += next_frame(index).reduce(:+)
    end

    extra_points += 10
  end

  def spare_score(frame_score, index)
    extra_points = 0

    if next_roll(index) == 'X' || next_roll(index) == '/'
      extra_points += 0
    else
      extra_points += next_roll(index)
    end

    extra_points += 10
  end
end
