require './code_peg'

class Code
  CODE_LENGTH = 4
  attr_accessor :code
  
  def initialize(code = [])
    @code = code
  end

  def self.generate_rand_code
    puts 'Creating a code to be guessed...'

    CODE_LENGTH.times do |i|
      @code[i] = CodePeg.new('').get_rand_color
    end

    @code
  end

  # check validity of user code
  def self.is_valid_code?(code)
    input_arr.all? { |element| CodePeg::VALID_COLORS.include?(element.color.downcase) }
  end

  # override comparison method to compare inner code arrays instead of code instances
  def ==(other_object)
    @code == other_object.code
  end

  def find_key_pegs(code)
    key_pegs = []

    code.each_with_index do |code_peg, index|
      if @code[index].downcase == code_peg.downcase
        key_pegs << 'Correct'
      else
        key_pegs << 'Incorrect'
      end
    end

    p key_pegs
  end
end