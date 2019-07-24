class Setup

  attr_accessor :player1, :player2, :board, :grid, :players

  def initialize
    @board = Board.new
    @grid  = Grid.new(@board)
  end

  def execute
    prompt_players_info
    @game.start_game
  rescue Interrupt
    finish_game
  end

  private

  def finish_game
    system "clear" or system "cls"
    puts "Well, that's it!\n\n"
    exit
  end

  def prompt_players_info
    prompt_first_player
    prompt_second_player
    @players = [player1, player2]
    @game = Game.new(board, grid, players)
  end

  def prompt_first_player
    grid.print_board
    puts "Player 1 name: (or press ENTER to play by computer)"
    first_input = STDIN.gets.chomp
    @player1 = if first_input.empty?
                 Computer.new(name: "Hal3000", symbol: "O")
               else
                 Human.new(name: first_input, symbol: "O")
               end
  end

  def prompt_second_player
    grid.print_board
    puts "Player 2 name: (or press ENTER to play by computer)"
    second_input = STDIN.gets.chomp
    @player2 = if second_input.empty?
                 Computer.new(name: "Skynet", symbol: "X")
               else
                 Human.new(name: second_input, symbol: "X")
               end
  end
end
