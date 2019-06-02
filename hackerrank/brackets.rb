# @param {String} s
# @return {Boolean}
def is_valid(s)
    open_to_close = {
        "{" => "}",
        "[" => "]",
        "(" => ")",
    }

    stack = []

    s.chars.each do |char|
        if open_to_close[char]
            stack << char
        else
            return false if open_to_close[stack.pop] != char
        end
    end

    stack.empty? ? true : false
end
