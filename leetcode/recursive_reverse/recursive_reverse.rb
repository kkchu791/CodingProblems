def recursiveReverse(string)
  raise ArgumentError if string.class != String
  if string.length == 0
    return ""
  end

  string[-1] + recursiveReverse(string.chop)

end

string = "hello"
recursiveReverse(string) === "olleh"
