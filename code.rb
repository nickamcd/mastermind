# frozen_string_literal: true

require './code_peg'

class Code
  CODE_LENGTH = 4
  attr_accessor :pegs

  def initialize(pegs = [])
    @pegs = pegs
  end

  def self.generate_rand_code
    puts 'Creating a code to be guessed...'

    CODE_LENGTH.times do |i|
      @pegs[i] = CodePeg.new('').get_rand_color
    end

    @pegs
  end

  # check validity of user code
  def self.is_valid_code?(code)
    code.pegs.all? { |element| CodePeg::VALID_COLORS.include?(element.color.downcase) }
  end

  # override == operator to compare inner code arrays instead of code instances
  def ==(other)
    if other.class == self.class
      other.pegs.each_with_index do |code_peg, index|
        return false if @pegs[index].color.downcase != code_peg.color.downcase
      end
      return true
    end
    false
  end

  def find_key_pegs(code)
    key_pegs = []

    code.pegs.each_with_index do |code_peg, index|
      key_pegs << if @pegs[index].color.downcase == code_peg.color.downcase
                    'Correct'
                  else
                    'Incorrect'
                  end
    end

    p key_pegs
  end
end
