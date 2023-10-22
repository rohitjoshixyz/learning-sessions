class Email
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
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

  def to_str
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
