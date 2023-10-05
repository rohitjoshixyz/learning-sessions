require "cgi"
require "json"

class Cookie
  def initialize(name, value)
    @name = name
    @value = value
  end

  def to_s
    "#{@name}: #{@value}"
  end

  def self.parse(cookie_string)
    cookie_string = CGI.unescape(cookie_string)
    cookie_string.split("; ").map do |cookie|
      name, value = cookie_string.split("=")
      Cookie.new(name, value)
    end
  end
end

cookie_1 = "v1%3A169424947504206109"
puts Cookie.parse(cookie_1)

cookie_2 = "_iub_cs-18778700%3D%7B%22timestamp%22%3A%222023-09-25T13%3A23%3A49.905Z%22%2C%22version%22%3A%221.51.0%22%2C%22consent%22%3Atrue%2C%22id%22%3A18778700%2C%22cons%22%3A%7B%22rand%22%3A%22d42fe6%22%7D%7D%3B+Auth-Token%3D12345"

puts Cookie.parse(cookie_2)

