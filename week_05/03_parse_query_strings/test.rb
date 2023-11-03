require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def test_empty_url
    assert_equal({}, Solution.new.call(""))
  end

  def test_empty_query_string
    assert_equal({}, Solution.new.call("https://google.com"))
  end

  def test_query_string_with_question_mark_but_no_params
    assert_equal({}, Solution.new.call("https://google.com?"))
  end

  def test_query_string_with_question_mark_and_one_param
    assert_equal({ "a" => "2" }, Solution.new.call("https://google.com?a=2"))
  end

  def test_query_string_with_multiple_params
    assert_equal(
      { "a" => "2", "b" => "3" },
      Solution.new.call("https://google.com?a=2&b=3")
    )
  end

  def test_query_string_with_encoded_params
    assert_equal(
      { "name" => "Rohit Joshi", "age" => "26" },
      Solution.new.call("https://google.com?name=Rohit%20Joshi&age=26")
    )
  end
end
