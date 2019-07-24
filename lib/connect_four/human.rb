class Human < Player

  def prompt_column(grid)
    puts "#{name}, please select a column:"
    check_column_range(grid)
  end

  def winning_message
    puts "🎆🎆🎆🎆🎆 #{name} WINS! Try again? (y/n)"
  end
end
