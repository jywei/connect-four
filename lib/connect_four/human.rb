class Human < Player

  def prompt_column(grid)
    puts "#{name}, introduce a column:"
    check_column_range(grid)
  end

end
