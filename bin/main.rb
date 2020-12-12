# !/usr/bin/env ruby
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

new_game = Game.new
player_one = Player.new('', 'X')
player_two = Player.new('', 'O')
positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
position = ''

#Created the gap method to replace the repeated blank lines
def gap
  2.times { puts ''}
end

def valid_name?(name)
  return true unless name == ''
  false
end

def print_board(new_game)
  puts "
     _________________
    |     |     |     |
    |  #{new_game.board[0][0]}  |  #{new_game.board[0][1]}  |  #{new_game.board[0][2]}  |
    |_____|_____|_____|
    |     |     |     |
    |  #{new_game.board[1][0]}  |  #{new_game.board[1][1]}  |  #{new_game.board[1][2]}  |
    |_____|_____|_____|
    |     |     |     |
    |  #{new_game.board[2][0]}  |  #{new_game.board[2][1]}  |  #{new_game.board[2][2]}  |
    |_____|_____|_____|
  "
end

#Created prompt method
def prompt_user(new_player, code)
  while true
    print "Player #{code} enter your name: "
    new_player.name = gets.chomp
    if valid_name?(new_player.name)
      puts "#{new_player.name} your symbol is #{new_player.symbol}"
      break
    else
      puts 'Invalid name, try again'
      next
    end
  end
end

gap
print '                  TIC TAC TOE'
puts "
               _________________
              |     |     |     |
              |  #{new_game.board[0][0]}   |  #{new_game.board[0][1]}   |  #{new_game.board[0][2]}   |
              |_____|_____|_____|
              |     |     |     |
              |  #{new_game.board[1][0]}   |  #{new_game.board[1][1]}   |  #{new_game.board[1][2]}   |
              |_____|_____|_____|
              |     |     |     |
              |  #{new_game.board[2][0]}   |  #{new_game.board[2][1]}   |  #{new_game.board[2][2]}   |
              |_____|_____|_____|
"
gap
#Created the prompt_user method and refactored out the two while loops
prompt_user(player_one, 1)
gap
prompt_user(player_two, 2)
gap
puts "     ===============LET'S PLAY!==============="
gap
new_game.reset_board
game_ended = false
is_player_one_move = true
until game_ended
  symbol = is_player_one_move ? 'X' : 'O'
  current_player = ''
  if is_player_one_move
    print "#{player_one.name} select a position from #{positions}: "
    current_player = player_one.name
  else
    print "#{player_two.name} select a position from #{positions}: "
    current_player = player_two.name
  end

  while true
    position = gets.chomp
    if new_game.is_choice_valid?(position)
      spot = new_game.get_spot(position)
      if new_game.is_spot_valid?(spot)
        new_game.update_board(spot, symbol)
        positions.delete(position.to_i)
        break
      else
        puts 'That spot is already taken!, pick another one'
      end
    else
      puts 'Invalid position, try another one!'
    end
    gap
  end

  print_board(new_game)
  
  if new_game.is_win? && symbol == 'X'
    puts "Congratz #{current_player}! You're the Winner :)"
    gap
    game_ended = true
  elsif new_game.is_win? && symbol == 'O'
    puts "Congratz #{current_player}! You're the Winner :)"
    gap
    game_ended = true
  elsif new_game.is_draw?
    puts "It's a draw!"
    gap
    game_ended = true
  else
    is_player_one_move = !is_player_one_move
  end
#Prompt User to play on
  if game_ended
    print "Do you want to continue playing? , enter 'Y' to continue or any key to exit :  "
    response = gets.chomp.downcase
    game_ended = response =='y' ? false : true
    new_game.reset_board
    positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    gap
    if game_ended
      puts "Thanks for playing, goodbye!"
      gap
    else
      puts "======== Welcome to your new game ========"
      print_board(new_game)
    end
  end
end
