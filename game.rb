require './player'

class Game
  TURN_TOTAL = 12
  rounds = -1
  attr_reader :players, :code_breaker, :code_maker

  def initialize(players, code_breaker, code_maker)
    @players = players
    @code_breaker, @code_maker = players.shuffle
  end

  def start_game
    # begin game by asking for amount of rounds
    loop do
      puts 'Please enter an even number of rounds to play'

      rounds = gets.chomp.to_i

      break if rounds % 2 == 0
    end

    puts "number of rounds: #{rounds}"

    puts 'enter player name'

    player_name = gets.chomp

    player_1 = Player.new(player_name)

    puts player_1.name

    computer_player = Player.new('Computer')

    computer_code = Code.generate_rand_code
  end

  def play_round
    turn_count = 0
    code_guessed = false

    puts "Code Maker #{@code_maker.name} must create a code to be guessed:"
    code_maker.create_code

    while turn_count < TURN_TOTAL
      puts "Code Breaker #{@code_breaker.name}, make a guess:"

      if code_breaker.code == code_maker.code
        puts "Correct Code!"
        puts "Code Maker #{@code_maker.name} earns #{turn_count} points!"
        break
      end

      # give key pegs for hint
      code_breaker.code.find_key_pegs(code_maker.code)

      turn_count += 1
    end

    if turn_count == TURN_TOTAL
      puts "The code was not guessed!"
      puts "The code maker earns a bonus point!"
      turn_count += 1
    end

    # assign points to the code maker
    code_maker.points += turn_count

    # switch roles at the end of round
    @code_breaker, @code_maker = @code_maker, @code_breaker
  end
end