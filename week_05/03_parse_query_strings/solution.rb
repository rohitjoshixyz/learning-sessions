class Solution
  require "uri"

  def call(input)
    url = URI.decode_www_form_component(input)
    return {} unless url.include?("?")
    return {} if url.split("?").length == 1

    query_string = url.split("?").last

    query_string.split("&").map { |param| param.split("=") }.to_h
  end
end
