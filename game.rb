# frozen_string_literal: true

require './player'
require './code'

class Game
  TURN_TOTAL = 12
  attr_reader :players, :code_breaker, :code_maker

  def initialize(players)
    @players = players
    @code_breaker, @code_maker = players.shuffle
  end

  def start_game
    rounds = -1

    # begin game by asking for amount of rounds
    loop do
      puts 'Please enter an even number of rounds to play'

      rounds = gets.chomp.to_i

      break if rounds.even? && rounds != 0
    end

    play_game(rounds)
  end

  private

  def play_game(rounds)
    # clear terminal to start game
    system 'clear'
    round_count = 1

    while round_count <= rounds
      play_round
      round_count += 1
    end

    puts 'Points:'
    puts "  #{players[0].name}: #{players[0].points}"
    puts "  #{players[1].name}: #{players[1].points}"

    if players[0].points == players[1].points
      puts 'Its a tie!'
    else
      winner = players[0].points > players[1].points ? players[0] : players[1]

      puts "Congratulations #{winner.name}!"
      puts 'You win!'
    end
  end

  def play_round
    turn_count = 1

    puts "Code Maker #{@code_maker.name} must create a code to be guessed:"
    answer = code_maker.create_code
    # hide code
    system 'clear'

    while turn_count <= TURN_TOTAL
      puts "Turn #{turn_count}:\n\n"
      puts "Code Breaker #{@code_breaker.name}, make a guess:"
      guess = code_breaker.create_code

      # give key pegs for hint
      puts ''
      guess.find_key_pegs(answer)
      puts ''

      if guess == answer
        puts 'Correct Code!'
        puts "Code Maker #{@code_maker.name} earns #{turn_count} points!\n\n"
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
