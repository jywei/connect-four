class Board

  attr_accessor :two_dimensional_arrays

  def initialize
    create_board
  end

  def create_board
    @two_dimensional_arrays = Array.new(6) { Array.new(7) { "-" } }
  end
end