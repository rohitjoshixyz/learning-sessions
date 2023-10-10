class Solution
  def call(input)
    counts = []

    input.each do |element|
      counts[element] ||= 0
      counts[element] += 1
    end
    # puts counts.inspect

    output = []
    counts.each_with_index do |count, i|
      (count || 0).times do
        output << i
      end
    end
    output
  end
end

