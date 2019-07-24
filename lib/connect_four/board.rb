class Board

  attr_accessor :two_dimensional_arrays

  def initialize
    create_board
  end

  def create_board
    @two_dimensional_arrays = Array.new(6) { Array.new(7) { "." } }
    # @two_dimensional_arrays = [
    #   [".", ".", ".", ".", ".", ".", "."],
    #   [".", ".", ".", ".", ".", ".", "."],
    #   [".", ".", ".", ".", ".", ".", "."],
    #   [".", ".", "O", "X", ".", ".", "."],
    #   [".", "O", "O", "X", ".", ".", "."],
    #   ["O", "X", "X", "X", "O", ".", "."]
    # ]
  end

  def fill_column(column, player, grid)
    # fill symbols from buttom to the top
    @two_dimensional_arrays.reverse.each do |row|
      next unless row[column] == "."
      row[column] = player.symbol
      break
    end
  end

  def can_fill?(column)
    @two_dimensional_arrays.map { |row| row[column] }.any? { |slot| slot == "." }
  end

end