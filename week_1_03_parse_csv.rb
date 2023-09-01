class MyCSV
  def self.generate_sample_csv
    File.open('sample.csv', 'w') do |writer|
      writer << "JAN,340,360,417\n"
      writer << "FEB,318,342,391\n"
      writer << "MAR,362,406,419\n"
      writer << "APR,348,396,461\n"
      writer << "MAY,363,420,472\n"
      writer << "JUN,435,472,535\n"
      writer << "JUL,491,548,622\n"
      writer << "AUG,505,559,606\n"
      writer << "SEP,404,463,508\n"
      writer << "OCT,359,407,461\n"
      writer << "NOV,310,362,390\n"
      writer << "DEC,337,405,432\n"
    end
  end

  def self.parse(file_path)
    File.read(file_path).split("\n").map{ |row| row.split(",") }
  end
end
MyCSV.generate_sample_csv
puts MyCSV.parse("sample.csv").inspect
