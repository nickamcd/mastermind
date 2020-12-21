require './code_peg'
require './code'

class Player
  attr_accessor :name, :code, :points

  def initialize (name, code = Code.new)
    @name = name
    @code = code
    @points = 0;
  end

  def create_code
    valid = false
    new_code = Code.new

    while !valid do
      puts "Please enter a code made up of the #{Code::CODE_LENGTH} of the following peg colors"
      p CodePeg::VALID_COLORS

      #get each peg color from the user
      Code::CODE_LENGTH.times do |i|
        puts "Enter peg #{i + 1}"
        new_code.pegs << CodePeg.new(gets.chomp.strip)
      end

      #check the validity of user input
      valid = Code.is_valid_code?(@code)
    end

    new_code
  end
end