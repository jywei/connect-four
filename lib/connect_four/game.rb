class Game

  attr_accessor :board, :grid, :players

  def initialize(board, grid, players)
    @board   = board
    @grid    = grid
    @players = players
  end

  def start_game
    main_game_function
  rescue Interrupt
    finish_game
  end

  def finish_game
    system "clear" or system "cls"
    puts "Well, that's it!\n\n"
    exit
  end

  def main_game_function
    loop do
      players.each do |player|
        valid, print_board = false, true
        until valid
          grid.print_board if print_board
          column = player.prompt_column(grid)
          if board.can_fill?(column)
            valid = true
            board.fill_column(column, player, grid)
          end
          grid.print_board
          puts "Column #{column + 1} is full. Please retry!\n\n"
          print_board = false
        end
      end
    end
  end

end