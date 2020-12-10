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
end

