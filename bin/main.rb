# !/usr/bin/env ruby

@position = [1, 2, 3, 4, 5, 6, 7, 8, 9]
def get_name(name)
  puts "#{name} enter your name:"
end

def make_move(player)
  puts "#{player} make your move"
  puts "Select a position you want to move to from #{@position}"
end

def display_board
  board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  puts "             _________________
                    |     |     |     |
                    |  #{board[0][0]}  |  #{board[0][1]}  |  #{board[0][2]}  |
                    |_____|_____|_____|
                    |     |     |     |
                    |  #{board[1][0]}  |  #{board[1][1]}  |  #{board[1][2]}  |
                    |_____|_____|_____|
                    |     |     |     |
                    |  #{board[2][0]}  |  #{board[2][1]}  |  #{board[2][2]}  |
                    |_____|_____|_____|"
end

def current_player(player)
  make_move(player)
  # move = gets.chomp.to_i
  puts ''
  puts "#{player} the move you made is invalid, please try again!"
  display_board
  puts ''
  puts "Congs #{player}, you are the winner!"
  puts ''
  puts "It's a draw, you can play again!"
  puts ''
end

print '                        TIC TAC TOE'
display_board

puts ''
get_name('Player 1')
player_one = gets.chomp
puts "#{player_one} your symbol is 'X'"
puts ''
get_name('Player 2')
player_two = gets.chomp
puts "#{player_two} your symbol is 'O'"
puts ''
# Game starts
puts "                      ===============LET'S PLAY!==============="

game_ended = false
is_player_one_move = true

until game_ended
  if is_player_one_move
    current_player(player_one)
    is_player_one_move = false
  else
    current_player(player_two)
    is_player_one_move = true
    game_ended = true
  end
end
