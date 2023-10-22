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

  def test_invalid_email
    assert_raises(RuntimeError, "Not a valid email") do
      Email.new("invalid_email")
    end

    assert_raises(RuntimeError, "Not a valid email") do
      Email.new(".email@example.com")
    end
  end
end
