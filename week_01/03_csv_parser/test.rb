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

  def test_different_separator
    File.open("test.csv", "w") do |writer|
      writer << "JAN::340::360::417;"
      writer << "FEB::318::342::391;"
      writer << "MAR::362::406::419;"
      writer << "APR::348::396::461;"
      writer << "MAY::363::420::472;"
      writer << "JUN::435::472::535;"
      writer << "JUL::491::548::622;"
      writer << "AUG::505::559::606;"
      writer << "SEP::404::463::508;"
      writer << "OCT::359::407::461;"
      writer << "NOV::310::362::390;"
      writer << "DEC::337::405::432;"
    end

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

    assert_equal expected_output, MyCSV.parse("test.csv", "::", ";")
    File.delete("test.csv")
  end
end
