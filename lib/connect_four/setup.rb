class Setup
  attr_accessor :player1, :player2, :board, :grid, :players

  def initialize
    @board = Board.new
    @grid  = Grid.new(@board)
  end

  def execute
    prompt_players_info
    start_game
  rescue Interrupt
    finish_game
  end

  private

  def start_game
    @game.start_game
  end

  def finish_game
    @game.finish_game
  end

  def prompt_players_info
    grid.print_board
    puts "Player 1 name: (or press ENTER to play by computer)"
    first_input = STDIN.gets.chomp
    @player1 = if first_input.empty?
                 Computer.new(name: "Hal3000", symbol: "O")
               else
                 Human.new(name: first_input, symbol: "O")
               end
    grid.print_board
    puts "Player 2 name: (or press ENTER to play by computer)"
    second_input = STDIN.gets.chomp
    @player2 = if second_input.empty?
                 Computer.new(name: "Skynet", symbol: "X")
               else
                 Human.new(name: second_input, symbol: "X")
               end
    @players = [player1, player2]
    @game = Game.new(@board, @grid, @players)
  end
end
