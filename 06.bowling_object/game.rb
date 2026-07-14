# frozen_string_literal: true

require_relative 'shot'
require_relative 'frame'

class Game
  attr_reader :score_tokens

  def initialize(input_score)
    @score_tokens = input_score.split(',')
  end

  def total_score
    roll_index = 0

    10.times.sum do
      frame = Frame.new(rolls, roll_index)
      roll_index += frame.roll_count

      frame.score
    end
  end

  private

  def rolls
    @rolls ||= score_tokens.map do |token|
      Shot.new(token).score
    end
  end
end
