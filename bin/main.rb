#!/usr/bin/env ruby
def get_name(name)
  puts "#{name} enter your name:"
end

def make_move(player)
  puts "#{player} make your move"
end

print '                        TIC TAC TOE'
board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
puts "
                     _________________
                    |     |     |     |
                    |  #{board[0][0]}  |  #{board[0][1]}  |  #{board[0][2]}  |
                    |_____|_____|_____|
                    |     |     |     |
                    |  #{board[1][0]}  |  #{board[1][1]}  |  #{board[1][2]}  |
                    |_____|_____|_____|
                    |     |     |     |
                    |  #{board[2][0]}  |  #{board[2][1]}  |  #{board[2][2]}  |
                    |_____|_____|_____|
"
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
make_move(player_one)
# move = gets.chomp.to_i
puts ''
make_move(player_two)
# move = gets.chomp.to_i
