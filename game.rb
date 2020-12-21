require './player'
require './code'

class Game
  TURN_TOTAL = 12
  rounds = -1
  attr_reader :players, :code_breaker, :code_maker

  def initialize(players)
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

  end

  def play_round
    turn_count = 1
    code_guessed = false

    puts "Code Maker #{@code_maker.name} must create a code to be guessed:"
    answer = code_maker.create_code

    while turn_count <= TURN_TOTAL
      puts "Code Breaker #{@code_breaker.name}, make a guess:"
      guess = code_breaker.create_code

      # give key pegs for hint
      guess.find_key_pegs(answer)

      if guess == answer
        puts 'Correct Code!'
        puts "Code Maker #{@code_maker.name} earns #{turn_count} points!"
        break
      end
      turn_count += 1
    end

    if turn_count > TURN_TOTAL
      puts 'The code was not guessed!'
      puts 'The code maker earns a bonus point!'
    end

    # assign points to the code maker
    code_maker.points += turn_count

    # switch roles at the end of round
    @code_breaker, @code_maker = @code_maker, @code_breaker
  end
end

player1 = Player.new('Tom')
player2 = Player.new('Jerry')

player_arr = [player1, player2]

test = Game.new(player_arr)

test.play_round