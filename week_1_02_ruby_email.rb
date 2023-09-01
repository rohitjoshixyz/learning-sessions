class Email
  EMAIL_REGEX = Regexp.new('^[A-Za-z0-9+_.-]+@(.+)$').freeze
  def initialize(email)
    if EMAIL_REGEX.match?(email)
      @email = email
    else
      raise "Not a valid email"
    end
  end

  def value
    @email
  end

  def value=(email)
    @email = email
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
valid_email = Email.new("rohit@circle.co")
puts valid_email

invalid_email = Email.new("invalid_email")
puts invalid_email
