class Player
  attr_accessor :name
  attr_reader   :symbol

  def initialize(name:, symbol:)
    @name   = name
    @symbol = symbol
  end

  def prompt_column(grid)
    puts "#{name}, please select a column:"
    check_column_range(grid)
  end

  private

  def check_column_range(grid)
    loop do
      input = STDIN.gets.chomp
      return input.to_i - 1 if input =~ /^[1-7]$/
      finish_game           if input == "exit".downcase

      grid.print_board
      puts "'#{input}' is not a correct column.\n\nIntroduce a column:"
    end
  end

  def finish_game
    system "clear" or system "cls"
    puts "Well, that's it!\n\n"
    exit
  end

end
