class Computer < Player

  def prompt_column(_grid)
    puts "#{name}'s move!"
    sleep 1
    rand(0..6)
  end

  def winning_message
    puts "#{name} RULES! 💀💀💀💀💀 Try again? (y/n)"
  end

end
