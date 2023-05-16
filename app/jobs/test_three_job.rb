class TestThreeJob < ApplicationJob
  queue_as :default

  def perform(input)
    climb_stairs(input)
  end

  def climb_stairs(n)
    return 1 if n <= 1
    return 2 if n == 2
    5
    dp = [0] * (n + 1)
    dp[1] = 1
    dp[2] = 2

    (3..n).each do |i|
      dp[i] = dp[i - 1] + dp[i - 2]
    end

    dp[n]
  end
end
