class CodePeg
  VALID_COLORS = ['red', 'orange', 'yellow', 'green', 'blue', 'purple']

  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def get_rand_color
    VALID_COLORS[rand(VALID_COLORS.length)]
  end
end