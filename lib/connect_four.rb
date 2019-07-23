require_relative "connect_four/board"
require_relative "connect_four/grid"
require_relative "connect_four/player"
require_relative "connect_four/human"
require_relative "connect_four/computer"
require_relative "connect_four/setup"
require_relative "connect_four/game"

board = Board.new
grid = Grid.new(board)
grid.print_board
