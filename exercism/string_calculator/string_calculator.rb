class StringCalculator
  def initialize()
    @count = 0
  end

  def add(string)
    @count += 1 #incrementing invoke count for counter
    validate_for_negative_numbers(string)
    return 0 if string.empty?
    string_to_numbers(string).reduce { |acc, el| acc + el }
  end

  def get_called_count
    @count
  end

  private

  def string_to_numbers(string)
    string.chars.map(&:to_i)
  end

  def validate_for_negative_numbers(string)
    if string.include?("-")
      raise "Negatives not allowed: #{get_negative_numbers(string)}"
    end
  end

  def get_negative_numbers(string)
    arr = string.chars
    res = ""
    arr.each_with_index do |el, index|
      if el == "-"
        res << "-" + arr[index + 1]
      end
    end
    res
  end
end
