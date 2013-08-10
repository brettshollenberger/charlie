class Game
  attr_accessor :player_count, :players, :player_order, :puzzle, :turn

  def start
    setup
    play_game
  end

  def setup
    @player_count = get_player_count
    @players = []
    @player_order = []
    get_player_names
    shuffle_players
    @puzzle = Puzzle.new
    @turn = 0
  end

  def get_player_count
    puts "How many players?"
    player_count = gets.chomp.to_i
    return player_count if valid_player_count?(player_count)
    get_player_count
  end

  def valid_player_count?(player_count)
    return true if player_count >= 1 && player_count <= 5
    return false
  end

  def get_player_names
    (1..@player_count).each do |index|
      @players.push(get_player_name(index).capitalize)
    end
  end

  def get_player_name(index)
    puts "What is Player #{index}'s name?"
    name = gets.chomp
    return name if valid_name?(name)
    invalid_name(name, index)
  end

  def valid_name?(name)
    @players.each { |player| return false if player.downcase == name.downcase }
    return true
  end

  def invalid_name(name, index)
    puts "I'm sorry, #{name} is already taken. Please try again."
    get_player_name(index)
  end

  def shuffle_players
    puts "Now shuffling players. The order will be:"
    index = 1
    @players.shuffle.each do |player|
      puts "#{index}: #{player}"
      index += 1
      player_order.push(player)
    end
  end

  def play_game
    take_turn until @puzzle.solved?
  end

  def take_turn
    puts "#{player_order[@turn]}, take a guess:"
    guess = gets.chomp
    puts "We found #{guess}!" if @puzzle.found?(guess)
    @puzzle.guess(guess)
    check_solved
    switch_turn
  end

  def check_solved
    puts "#{player_order[@turn]} wins!" if @puzzle.solved?
  end

  def switch_turn
    @turn += 1 unless @turn >= @players.length
    @turn = 0 if @turn >= @players.length
  end

end
