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

  def try_again
    loop do
      case STDIN.gets.chomp.downcase
      when "y" then restart_game
      when "n" then finish_game
      else type_yes_or_no
      end
    end
  end

  def restart_game
    board.create_board
    start_game
  end

  def type_yes_or_no
    grid.print_board
    puts "Please enter 'y' or 'n'"
  end

  private

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
            check_winner(player)
          end
          grid.print_board
          puts "Column #{column + 1} is full. Please retry!\n\n"
          print_board = false
        end
      end
    end
  end

  def winner(player)
    grid.print_board
    player.winning_message
    try_again
  end

  def check_winner(player)
    check_rows_and_columns(player)
    check_diagonals(player)
  end

  def check_rows_and_columns(player)
    check_arrays(board.two_dimensional_arrays, player)
    check_arrays(board.two_dimensional_arrays.transpose, player)
  end

  def check_diagonals(player)
    diagonal_winning_options.each do |direction, starting_point|
      starting_point.each do |start|
        array_for_testing = []
        (0..3).each do |move|
          array_for_testing << board.two_dimensional_arrays[start[0] + move][start[1] + (move * direction)]
        end
        checking_four_in_a_row(array_for_testing, player)
      end
    end
  end

  def check_arrays(arrays, player)
    arrays.each do |row|
      checking_four_in_a_row(row, player)
    end
  end

  def checking_four_in_a_row(array, player)
    winner(player) if array.join =~ /#{player.symbol}{4}/
  end

  def diagonal_winning_options
    {
      1 => [
        [0, 0], [0, 1], [0, 2], [0, 3],
        [1, 0], [1, 1], [1, 2], [1, 3],
        [2, 0], [2, 1], [2, 2], [2, 3]
      ],
      -1 => [
        [0, 3], [0, 4], [0, 5], [0, 6],
        [1, 3], [1, 4], [1, 5], [1, 6],
        [2, 3], [2, 4], [2, 5], [2, 6]
      ]
    }
  end

end