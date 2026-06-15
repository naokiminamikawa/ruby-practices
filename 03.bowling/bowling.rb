#!/usr/bin/env ruby
# frozen_string_literal: true

input_score = ARGV[0]
score_tokens = input_score.split(',')

# 各投球のピン数配列（rolls）
rolls = score_tokens.map do |token|
  token == 'X' ? 10 : token.to_i
end

roll_index = 0

total_score = 10.times.sum do
  if rolls[roll_index] == 10
    # ストライク
    score = rolls[roll_index, 3].sum
    roll_index += 1
  else
    frame_total = rolls[roll_index, 2].sum

    score = if frame_total == 10
              # スペア
              rolls[roll_index, 3].sum
            else
              frame_total
            end

    roll_index += 2
  end

  score
end

puts total_score
