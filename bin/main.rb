#!/usr/bin/env ruby
require_relative '../lib/game.rb'
puts ''
print '                  TIC TAC TOE'
puts '
               _________________
              |     |     |     |
              |  1  |  2  |  3  |
              |_____|_____|_____|
              |     |     |     |
              |  4  |  5  |  6  |
              |_____|_____|_____|
              |     |     |     |
              |  7  |  8  |  9  |
              |_____|_____|_____|
'
puts ''
puts 'Player enter your name:'
player_one = gets.chomp
puts "#{player_one} your symbol is 'X'"
puts ''
puts 'Player enter your name:'
player_two = gets.chomp
puts "#{player_two} your symbol is 'O'"
puts ''
puts "            ===============LET'S PLAY!==============="
game_ended = false
is_player_one_move = true
until game_ended
  if is_player_one_move
    # current_player(player_one)
    puts "#{player_one} make your move"
    puts ''
    puts 'Select a position from [1, 2, 3, 4, 5, 6, 7, 8, 9]'
    puts ''
    puts "#{player_one} the move you made is invalid, please try again!"
    puts '
               _________________
              |     |     |     |
              |  1  |  2  |  3  |
              |_____|_____|_____|
              |     |     |     |
              |  4  |  5  |  6  |
              |_____|_____|_____|
              |     |     |     |
              |  7  |  8  |  9  |
              |_____|_____|_____|
'
    puts ''
    puts "Congs #{player_one}, you are the winner!"
    puts ''
    puts "It's a draw, you can play again!"
    puts ''
    is_player_one_move = false
  else
    # current_player(player_two)
    puts "#{player_two} make your move"
    puts 'Select a position from [1, 2, 3, 4, 5, 6, 7, 8, 9]'
    puts ''
    puts "#{player_two} the move you made is invalid, please try again!"
    puts '
               _________________
              |     |     |     |
              |  1  |  2  |  3  |
              |_____|_____|_____|
              |     |     |     |
              |  4  |  5  |  6  |
              |_____|_____|_____|
              |     |     |     |
              |  7  |  8  |  9  |
              |_____|_____|_____|
'
    puts ''
    puts "Congs #{player_two}, you are the winner!"
    puts ''
    puts "It's a draw, you can play again!"
    puts ''
    is_player_one_move = true
    game_ended = true
  end
end
