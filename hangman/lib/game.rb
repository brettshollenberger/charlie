require './puzzle'

class Game
  attr_accessor :player_count, :players, :puzzle, :turn

  def initialize
    @player_count = get_player_count
    @players = []
    get_player_names
    @puzzle = Puzzle.new
    @turn = 0
    play_game
  end

  def get_player_count
    puts "How many players? (1 to 5)"
    player_count = gets.chomp
    return player_count.to_i if valid_player_count?(player_count)
    puts "I'm sorry, I didn't understand your response."
    get_player_count
  end

  def valid_player_count?(player_count)
    return true if player_count.to_i <= 5 && player_count.to_i >= 1
    return false
  end

  def get_player_names
    (1..@player_count).each do |player|
      get_player_name(player)
    end
  end

  def get_player_name(player)
    player_index = player - 1
    puts "What is player #{player}'s name?"
    try_name = gets.chomp
    if !player_name_taken?(try_name)
      @players.push(try_name.capitalize)
    else
      puts "I'm sorry, #{try_name} is already playing. Please try again."
      get_player_name(player)
    end
  end

  def player_name_taken?(player_name)
    @players.each {|player| return true if player_name.downcase == player.downcase }
    return false
  end

  def play_game
    while !@puzzle.solved?
      turn
    end
  end

  def turn
    make_guess
    check_win
    switch_turn
  end

  def make_guess
    puts "#{@players[@turn]}, make a guess."
    guess = gets.chomp
    check_guessed(guess)
    check_found(guess)
    @puzzle.guess(guess)
  end

  def check_guessed(guess)
    if @puzzle.guessed?(guess)
      puts "I'm sorry, #{guess} was already guessed."
      make_guess
    end
  end

  def check_found(guess)
    puts "We found #{guess}!" if @puzzle.found?(guess)
  end

  def check_win
    puts "#{ @players[@turn] } wins!" if @puzzle.solved?
  end

  def switch_turn
    @turn += 1 unless @turn >= @player_count
    @turn = 0 if @turn >= @player_count
  end

end

game = Game.new
