require './player'
require './code_peg'

class CodeMaker < Player
  def initialize(player, code = [])
    super(player, code)
  end

  def generate_rand_code()
    puts 'Creating a code to be guessed...'

    4.times do |i|
      temp_peg = CodePeg.new('sample')
      @code[i] = temp_peg.get_rand_color
    end

    @code
  end
end