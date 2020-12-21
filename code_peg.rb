# frozen_string_literal: true

class CodePeg
  VALID_COLORS = %w[red orange yellow green blue purple].freeze

  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def choose_rand_color
    VALID_COLORS[rand(VALID_COLORS.length)]
  end
end
