require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def test_valid_duration
    @duration = Duration.new("1:30")
    assert_equal "0 hours, 1 minutes 30 seconds", @duration.humanize
    assert_equal 30, @duration.seconds
    assert_equal 1, @duration.minutes
    assert_equal 0, @duration.hours
  end

  def test_invalid_duration
    assert_raises(DurationParserError, "Seconds value should be in between 0 to 60") do
      Duration.new("12:70")
    end

    assert_raises(DurationParserError, "Minutes value should be in between 0 to 60") do
      Duration.new("72:10")
    end
  end

  def test_addition_of_duration
    duration_1 = Duration.new("1:30")
    duration_2 = Duration.new("2:30")
    duration_3 = duration_1 + duration_2
    assert_equal "0 hours, 4 minutes 0 seconds", duration_3.humanize
  end
end
