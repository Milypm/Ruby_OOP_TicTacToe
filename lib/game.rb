class Game
  attr_reader :board
  def initialize
    @board = Array.new(3){Array.new(3)}
  end

  def reset_board
    board_num = 1
    while board_num <= 9
      @board.each_with_index do |row, i|
        row.each_with_index do |col, j|
          @board[i][j] = board_num
          board_num += 1
        end
      end
    end
  end

  def is_choice_valid?(choice)
    return true if [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(choice)
    false
  end

  def make_move(choice)
    position = {'1' => [0,0], '2' => [0,1], '3' => [0,2],
            '4' => [1,0], '5' => [1,1], '6' => [1,2],
            '7' => [2,0], '8' => [2,1], '9' => [2,2]
    }
    # move = {'1' => @board[0][0], '2' => @board[0][1], '3' => @board[0][2],
    #         '4' => @board[1][0], '5' => @board[1][1], '6' => @board[1][2],
    #         '7' => @board[2][0], '8' => @board[2][1], '9' => @board[2][2]
    # }
    position[choice]
  end
   
  def is_move_valid?(position)
    return false if @board[position[0]][position[1]] != 'X' || @board[position[0]][position[1]] != 'O'
    true
  end
  
  def update_board(move, symbol)
    @board[move[0]][move[1]] = symbol
  end

  def is_row_win?
    return true if @board[0][0] == @board[0][1] && @board[0][1] == @board[0][2]
    return true if @board[1][0] == @board[1][1] && @board[1][1] == @board[1][2]
    return true if @board[2][0] == @board[2][1] && @board[2][1] == @board[2][2]
    false
  end

  def is_col_win?
    return true if @board[0][0] == @board[1][0] && @board[1][0] == @board[2][0]
    return true if @board[0][1] == @board[1][1] && @board[1][1] == @board[2][1]
    return true if @board[0][2] == @board[1][2] && @board[1][2] == @board[2][2]
    false
  end

  def is_diag_win?
    return true if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
    return true if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]
    false
  end

  def is_win?
    return true if is_row_win?
    return true if is_col_win?
    return true if is_diag_win?
    false
  end

  def is_draw?
  end

  def is_board_full?
  end
end

game = Game.new
game.reset_board
choice = '3'
position = game.make_move(choice)
game.update_board(position, 'X')

choice = '5'
position = game.make_move(choice)
game.update_board(position, 'O')

choice = '7'
position = game.make_move(choice)
game.update_board(position, 'X')

p game.board
p game.is_win?
