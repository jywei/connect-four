require_relative "connect_four/board"
require_relative "connect_four/grid"
require_relative "connect_four/player"
require_relative "connect_four/human"
require_relative "connect_four/computer"

board = Board.new
grid = Grid.new(board)
grid.print_board
