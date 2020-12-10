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

  def set_position(move)
    location = {
      1 => @board[0][0],
      2 => @board[0][1],
      3 => @board[0][2],
      4 => @board[1][0],
      5 => @board[1][1],
      6 => @board[1][2],
      7 => @board[2][0],
      8 => @board[2][1],
      9 => @board[2][2]
    }
    if move == location[]
  end
end

