class Email
  EMAIL_REGEX = Regexp.new("^[A-Za-z0-9+_.-]+@(.+)$").freeze
  def initialize(email)
    if EMAIL_REGEX.match?(email)
      @email = email
    else
      raise "Not a valid email"
    end
  end

  def to_s
    @email.to_s
  end

  def inspect
    @email
  end

  def domain
    @email.split("@").last
  end

  def username
    @email.split("@").first
  end
end
