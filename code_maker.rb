require './player'
require './code_peg'

class CodeMaker < Player
  def initialize(player, code = [])
    @player = player
    @code = code
  end

  def create_code()
    puts 'Creating a code to be guessed...'

    4.times do |i|
      temp_peg = CodePeg.new('sample')
      @code[i] = temp_peg.get_rand_color
    end

    @code
  end
end

test_maker = CodeMaker.new('test')

puts test_maker.create_code