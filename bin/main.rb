# !/usr/bin/env ruby
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

puts ''
print '                  TIC TAC TOE'
new_game = Game.new
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
puts ''

while true
  print 'Player 1 enter your name: '
  player_one_name = gets.chomp
  if valid_name?(player_one_name)
    player_one = Player.new(player_one_name, 'X')
    puts "#{player_one_name} your symbol is 'X'"
    break
  else
    puts 'Invalid name, try again'
    puts ''
    next
  end
end

while true
  puts ''
  print 'Player 2 enter your name: '
  player_two_name = gets.chomp
  if valid_name?(player_two_name)
    player_two = Player.new(player_two_name, 'O')
    puts "#{player_two_name} your symbol is 'O'"
    break
  else
    puts 'Invalid name, try again'
    puts ''
    next
  end
end
puts ''
puts "     ===============LET'S PLAY!==============="
puts ''
new_game.reset_board
game_ended = false
is_player_one_move = true
positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
position = ''
# counter = 0
until game_ended
  symbol = is_player_one_move ? 'X' : 'O'
  current_player = ''
  if is_player_one_move
    print "#{player_one_name} select a position from #{positions}: "
    current_player = player_one_name
    # counter += 1
  else
    print "#{player_two_name} select a position from #{positions}: "
    current_player = player_two_name
  end
  while true
    position = gets.chomp
    if new_game.is_choice_valid?(position)
      spot = new_game.make_move(position)
      if new_game.is_move_valid?(spot)
        new_game.update_board(spot, symbol)
        positions.delete(position.to_i)
        break
      else
        puts 'That spot is already taken!, pick another one'
      end
    else
      puts 'Invalid position, try another one!'
    end
    puts ''
  end
  print_board(new_game)
  puts ''
  puts ''
  if new_game.is_win? && symbol == 'X'
    puts "Congratz #{current_player}! You're the Winner :)"
    game_ended = true
  elsif new_game.is_win? && symbol == 'O'
    puts "Congratz #{current_player}! You're the Winner :)"
    game_ended = true
  else
    if new_game.is_draw?
      puts "It's a draw!"
      game_ended = true
    else
      is_player_one_move = !is_player_one_move
    end
  end
end
