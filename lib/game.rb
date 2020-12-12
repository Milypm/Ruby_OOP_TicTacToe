class Game
  attr_reader :board

  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def reset_board
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def choice_valid?(choice)
    return true if %w[1 2 3 4 5 6 7 8 9].include?(choice)

    false
  end

  def get_spot(choice)
    spot = { '1' => [0, 0],
             '2' => [0, 1],
             '3' => [0, 2],
             '4' => [1, 0],
             '5' => [1, 1],
             '6' => [1, 2],
             '7' => [2, 0],
             '8' => [2, 1],
             '9' => [2, 2] }
    spot[choice]
  end

  def spot_valid?(spot)
    return true if @board[spot[0]][spot[1]] != 'X' && @board[spot[0]][spot[1]] != 'O'

    false
  end

  def update_board(spot, symbol)
    @board[spot[0]][spot[1]] = symbol
  end

  def win?
    return true if row_win?
    return true if col_win?
    return true if diag_win?

    false
  end

  def draw?
    return true if !win? && board_full?

    false
  end

  private

  def row_win?
    return true if @board[0][0] == @board[0][1] && @board[0][1] == @board[0][2]
    return true if @board[1][0] == @board[1][1] && @board[1][1] == @board[1][2]
    return true if @board[2][0] == @board[2][1] && @board[2][1] == @board[2][2]

    false
  end

  def col_win?
    return true if @board[0][0] == @board[1][0] && @board[1][0] == @board[2][0]
    return true if @board[0][1] == @board[1][1] && @board[1][1] == @board[2][1]
    return true if @board[0][2] == @board[1][2] && @board[1][2] == @board[2][2]

    false
  end

  def diag_win?
    return true if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
    return true if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]

    false
  end

  def board_full?
    return false if @board.flatten.any?(Numeric)

    true
  end
end
