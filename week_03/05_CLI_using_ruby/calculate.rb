#!/usr/bin/env ruby

def main
  if ARGV.empty?
    puts 'Usage: add|subtract|multiply|divide <number> <number>'
    return
  end

  operation = ARGV[0]
  first_number = ARGV[1].to_i
  second_number = ARGV[2].to_i

  result = case operation
  when "add"
    first_number + second_number
  when "subtract"
    first_number - second_number
  when "multiply"
    first_number * second_number
  when "divide"
    first_number / second_number
  else
    puts "Invalid operation"
    exit
  end

  puts "Result: #{result}"
end

main if __FILE__ == $0 # or $PROGRAM_NAME

# ./week_03/05_CLI_using_ruby/calculate.rb add 5 7
