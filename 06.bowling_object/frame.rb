# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :rolls, :start_index

  def initialize(rolls, start_index)
    @rolls = rolls
    @start_index = start_index
  end

  def score
    if strike?
      rolls[start_index, 3].sum
    elsif spare?
      rolls[start_index, 3].sum
    else
      rolls[start_index, 2].sum
    end
  end

  def strike?
    rolls[start_index] == 10
  end

  def space?
    rolls[start_index, 2].sum == 10
  end

  def roll_count
    strike? ? 1 : 2
  end
end
