def is_match(text, pattern)
  text_index = 0
  pattern_index = 0
  wild_card_skipper = nil

  while text_index <= text.length - 1 && pattern_index <= pattern.length
    chars_do_not_match = text[text_index] != pattern[pattern_index]
    next_char_is_wild_card = pattern[pattern_index + 1] == '*'
    curr_char_is_wild_card = pattern[pattern_index] == '*'
    curr_char_is_skipper = pattern[pattern_index] == '.'
    curr_char_is_wild_card_skipper = text[text_index] == wild_card_skipper

    if curr_char_is_skipper || curr_char_is_wild_card_skipper
       text_index += 1
       pattern_index += 1
       next
    end

    if curr_char_is_wild_card
      wild_card_skipper = pattern[pattern_index - 1]
      text_index += 1
      pattern_index += 1
      next
    end


    if (chars_do_not_match) && (next_char_is_wild_card)
      text_index -= 1
      pattern_index += 1
    elsif chars_do_not_match
       return false
    end

    wild_card_skipper = nil #reset wild card skipper
    text_index += 1
    pattern_index += 1
  end

  true
end

text = "aa"
pattern = "..."

p is_match(text, pattern) == true
