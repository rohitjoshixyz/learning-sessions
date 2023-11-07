class Solution
  def call(input)
    input.sort_by { |item| item.scan(/\d+/).first.to_i }
  end
end

Solution.new.call(%w(item1, item10, item2))
