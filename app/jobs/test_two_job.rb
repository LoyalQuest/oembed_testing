class TestTwoJob < ApplicationJob
  queue_as :default

  def perform(input)
    valid_brackets?(input)
  end

  def valid_brackets?(s)
    stack = []

    brackets = {
      ')' => '(',
      '}' => '{',
      ']' => '['
    }

    s.each_char do |char|
      if ['(', '{', '['].include?(char)
        stack.push(char)
      elsif [')', '}', ']'].include?(char)
        if stack.empty? || brackets[char] != stack.pop
          return false
        end
      end
    end

    stack.empty?
  end
end
