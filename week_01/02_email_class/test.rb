require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def test_valid_email
    email = Email.new("rohit@circle.co")
    assert_equal email.to_s, "rohit@circle.co"
    assert_equal email.username, "rohit"
    assert_equal email.domain, "circle.co"
    assert_equal email.inspect, "rohit@circle.co"
  end

  def test_more_valid_emails
    valid_emails = %w(
      email@example.com
      firstname.lastname@example.com
      email@subdomain.example.com
      firstname+lastname@example.com
      1234567890@example.com
      email@example-one.com
      _______@example.com
      email@example.name
      email@example.museum
      email@example.co.jp
      firstname-lastname@example.com
    )

    valid_emails.each do |email|
      assert_equal email, Email.new(email).to_s # Does not raise an error
    end
  end

  def test_invalid_email
    assert_raises(RuntimeError, "Not a valid email") do
      Email.new("invalid_email")
    end

    assert_raises(RuntimeError, "Not a valid email") do
      Email.new(".email@example.com")
    end
  end

  def test_more_invalid_emails
    invalid_emails = %w(
      plainaddress
      @example.com
      Joe Smith <
      email.example.com
      email@
      email@  123
      email@.com
      email@example..com
      Abc..
      “(),:;<>[\]@example.com
    )

    invalid_emails.each do |email|
      assert_raises(RuntimeError, "Not a valid email") do
        Email.new(email)
      end
    end
  end
end
