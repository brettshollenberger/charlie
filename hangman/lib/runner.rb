class Runner
  def numeric(output)
    puts output
    input = gets.chomp
    return input.to_i
  end

  def stringy(output)
    puts output
    input = gets.chomp
    return input
  end
end
