class Setup
  attr_accessor :player1, :player2
  attr_reader   :players, :board

  def initialize
    @player1 = Player.new(name: "Player 1", mark: "X")
    @player2 = Player.new(name: "Player 2", mark: "O")
    @players = [player1, player2]
    @board   = Board.new.two_dimensional_arrays
  end

  def setup
    prompt_players_info
    start_game
  rescue Interrupt
    exit_game
  end

  private

  def start_game
  end

  def exit_game
  end

  def prompt_players_info
    printer.print_board
    puts "Player 1 name:"
    player1.name = STDIN.gets.chomp
    printer.print_board
    puts "Player 2 name:"
    player2.name = STDIN.gets.chomp
  end
end
