class Grid
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def print_board
    system "clear" or system "cls"
    puts "\n"
    puts "\n"
    print_grid
    puts "\n"
  end

  private

  def print_grid
    puts "  ============================="
    puts "  |       CONNECT FOUR        |"
    puts "  ============================="
    puts "  | 1 | 2 | 3 | 4 | 5 | 6 | 7 |"
    (0..5).each do |index|
      puts "  -----------------------------"
      print_row(index)
    end
    puts "  -----------------------------"
  end

  def print_row(row)
    board.two_dimensional_arrays[row].each_with_index do |_, index|
      print "  | " if index.zero?
      print "   "  if (1..6).cover?(index)
      print_slot(row, index)
      print " |\n" if index == 6
    end
  end

  def print_slot(row, column_index)
    print board.two_dimensional_arrays[row][column_index]
  end
end
