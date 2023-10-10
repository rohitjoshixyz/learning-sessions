require "minitest/autorun"
require_relative "./solution"

class Test < Minitest::Test
  def test_parsing_csv_file
    MyCSV.generate_sample_csv
    expected_output = [
      ["JAN", "340", "360", "417"],
      ["FEB", "318", "342", "391"],
      ["MAR", "362", "406", "419"],
      ["APR", "348", "396", "461"],
      ["MAY", "363", "420", "472"],
      ["JUN", "435", "472", "535"],
      ["JUL", "491", "548", "622"],
      ["AUG", "505", "559", "606"],
      ["SEP", "404", "463", "508"],
      ["OCT", "359", "407", "461"],
      ["NOV", "310", "362", "390"],
      ["DEC", "337", "405", "432"]
    ]
    assert_equal expected_output, MyCSV.parse("sample.csv")
  end
end
