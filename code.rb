require './code_peg'

class Code
  CODE_LENGTH = 4
  attr_accessor :code
  
  def initialize(code = [])
    @code = code
  end

  def generate_rand_code()
    puts 'Creating a code to be guessed...'

    CODE_LENGTH.times do |i|
      temp_peg = CodePeg.new('sample')
      @code[i] = temp_peg.get_rand_color
    end

    @code
  end

  # check validity of user code
  def self.is_valid_code?(input_arr)
    input_arr.all? { |element| CodePeg::VALID_COLORS.include?(element.color.downcase) }
  end
end