# I am assuming the following
# HH:MM:SS notation for duration
# If we enter 45, its seconds
# If we enter 3:45 or 03:45 it will be 3 minutes and 45 seconds
# If we enter 10:55:22 it will be 10 hours 55 minuts and 22 secs

class DurationParserError < StandardError
end

class Duration
  attr_accessor :seconds, :hours, :minutes, :days

  def initialize(value)
    @days = 0
    @hours = 0
    @minutes = 0
    @seconds = 0

    split_value = value.split(":").map(&:to_i)
    case split_value.length
    when 1
      @seconds = split_value.first
      if @seconds < 0 || @seconds > 60
        raise DurationParserError.new("Seconds value should be in between 0 to 60")
      end
    when 2
      @minutes = split_value.first
      @seconds = split_value.last

      if @seconds < 0 || @seconds > 60
        raise DurationParserError.new("Seconds value should be in between 0 to 60")
      end

      if @minutes < 0 || @minutes > 60
        raise DurationParserError.new("Minutes value should be in between 0 to 60")
      end
    when 3
      @hours = split_value[0]
      @minutes = split_value[1]
      @seconds = split_value[2]

      if @seconds < 0 || @seconds > 60
        raise DurationParserError.new("Seconds value should be in between 0 to 60")
      end

      if @minutes < 0 || @minutes > 60
        raise DurationParserError.new("Minutes value should be in between 0 to 60")
      end
    end
  end

  def humanize
    "#{@hours} hours, #{@minutes} minutes #{@seconds} seconds"
  end

  def +(duration)
    remainder = (duration.seconds + self.seconds) % 60
    secs = remainder
    quotient = (duration.seconds + self.seconds) / 60

    remainder = (duration.minutes + self.minutes + quotient) % 60
    mins = remainder
    quotient = (duration.minutes + self.minutes) / 60

    hrs = duration.hours + self.hours + quotient

    Duration.new("#{hrs}:#{mins}:#{secs}")
  end
end
p Duration.new("6:45").humanize

begin
  p Duration.new("12:70").humanize
rescue => e
  p e.message
end

begin
  p Duration.new("72:10").humanize
rescue => e
  p e.message
end

p (Duration.new("6:45") + Duration.new("55:45")).humanize
