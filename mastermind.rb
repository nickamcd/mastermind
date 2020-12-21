require './player'
require './game'

class Mastermind
  players = []

  puts 'Player 1, please enter your name:'
  
  players[0] = Player.new(gets.chomp)

  puts 'Player 2, please enter your name:'

  players[1] = Player.new(gets.chomp)

  game = Game.new(players)

  game.start_game

end