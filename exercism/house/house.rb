class House
  OBJ_TO_ACTION = {'malt' => 'lay in',
              'rat' => 'ate',
              'cat' => 'killed',
              'dog' => 'worried',
              'cow with the crumpled horn' => 'tossed',
              'maiden all forlorn' => 'milked',
              'man all tattered and torn' => 'kissed',
              'priest all shaven and shorn' => 'married',
              'rooster that crowed in the morn' => 'woke',
              'farmer sowing his corn' => 'kept',
              'horse and the hound and the horn' => 'belonged to' }.freeze
  def self.recite
     first_stanza + double_line_break + create_next_stanza(0)
  end

  private

  def self.create_next_stanza(index)
    return "" if OBJ_TO_ACTION.keys[index].nil?

    stanza = ""
    prev_action = nil
    index.downto(0).each do |index|
      object = OBJ_TO_ACTION.keys[index]
      action = OBJ_TO_ACTION.values[index]

      if stanza.empty?
        stanza += first_line(object) + line_break
      else
        stanza += reoccuring_line(prev_action, object) + line_break
      end
      prev_action = action
    end

    stanza + last_line + double_line_break(index) + create_next_stanza(index + 1)
  end

  def self.first_line(object)
    starting_phrase(object)
  end

  def self.reoccuring_line(prev_action, object)
    "that #{prev_action} the #{object}"
  end

  def self.last_line
    "that lay in the house that Jack built."
  end

  def self.first_stanza
    "This is the house that Jack built."
  end

  def self.starting_phrase(object)
    "This is the #{object}"
  end

  def self.line_break
    "\n"
  end

  def self.double_line_break(index=nil)
    if index == 10
      line_break
    else
      line_break + line_break
    end
  end
end
