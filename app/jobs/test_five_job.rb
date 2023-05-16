class TestFiveJob < ApplicationJob
  queue_as :default

  def perform(input)
    find_unique_index(input)
  end

  def find_unique_index(array)
    odd_count = 0
    even_count = 0
    odd_index = nil
    even_index = nil

    array.each_with_index do |num, index|
      if num.odd?
        odd_count += 1
        odd_index = index
      elsif num.even?
        even_count += 1
        even_index = index
      end

      return odd_index if even_count > 1 && odd_count == 1
      return even_index if odd_count > 1 && even_count == 1
    end

    odd_index || even_index
  end
end
