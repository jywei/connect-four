class Board

  attr_accessor :board

  def initialize
    create_board
  end

  def create_board
    @board = Array.new(6) { Array.new(7) { "-" } }
  end
end