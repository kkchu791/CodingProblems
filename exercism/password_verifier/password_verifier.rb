class PasswordVerifier
  def initialize
  end

  def verify(string)
    verify_password_presence(string)
    verify_password_length(string)
    verify_password_has_one_upper_case(string)
    verify_password_has_one_lower_case(string)
    verify_password_has_one_number(string)


  end


  private

  def verify_password_length(string)
    raise "Password must be longer than 8 chars." if string.length <= 8
  end

  def verify_password_presence(string)
    raise "Password must be present." if string.nil?
  end

  def verify_password_has_one_upper_case(string)
    raise "Password must have one upper case letter." if string.match(/[A-Z]/).nil?
  end

  def verify_password_has_one_lower_case(string)
    raise "Password must have one lower case letter." if string.match(/[a-z]/).nil?
  end

  def verify_password_has_one_number(string)
    raise "Password must have at least one number." if string.match(/[0-9]/).nil?
  end
end
