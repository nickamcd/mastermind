require './code_peg'

class Player
  attr_accessor :name, :code, :points

  def initialize (name, code = [])
    @name = name
    @code = code
    @points = 0;
  end

  def create_code
    valid = false

    while !valid do
      puts 'Please enter a code made up of the 4 of the following peg colors'
      p CodePeg::VALID_COLORS

      4.times do |i|
        puts "Enter peg #{i + 1}"

        @code[i] = gets.chomp.strip
      end

      valid = Player.is_valid_code?(@code)

      p @code
    end

    p @code
  end



  # check validity of user code
  def self.is_valid_code?(input_arr)
    input_arr.all? { |element| CodePeg::VALID_COLORS.include?(element.downcase) }
  end
end

test_player = Player.new('test')

test_player.create_code