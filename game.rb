require './player'

class Game
  TURN_TOTAL = 12
  rounds = -1

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

    computer_code = computer_player.generate_rand_code
  end

  def play_round
    turn_count = 0

    while turn_count < TURN_TOTAL
      player_1.make_guess

      turn_count += 1
    end

    
  end
end