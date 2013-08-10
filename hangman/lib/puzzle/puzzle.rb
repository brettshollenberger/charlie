class Puzzle
  include Enumerable
  attr_reader :word, :puzzle, :guessed

  def initialize
    select_a_word
    set_guessed_to_empty_array
    set_puzzle
  end

  def select_a_word
    @word = Word.new
  end

  def set_guessed_to_empty_array
    @guessed = []
  end

  def set_puzzle
    @puzzle = puzzlify
  end

  def split_word
    @word.split('')
  end

  def reset
    initialize
  end

  def puzzlify
    split_word.map { |letter| Letter.new(letter) }
  end

  def stringify
    @puzzle.map { |letter| letter.display }
  end

  def display
    puts stringify
  end

  def each(&block)
    @puzzle.each(&block)
  end

  def guess(guess)
    reveal_letter(guess)
    add_guess_to_guessed(guess)
    show_puzzle_to_users
  end

  def reveal_letter(guess)
    @puzzle.each { |letter| letter.display = guess if letter.secret == guess }
  end

  def add_guess_to_guessed(guess)
    @guessed.push(guess)
  end

  def show_puzzle_to_users
    self.display
  end

  def in_puzzle?(guess)
    @puzzle.each { |letter| return true if letter.secret == guess }; false
  end

  def solved?
    @puzzle.each { |letter| return false if letter.unsolved? }; true
  end

  def guessed?(guess)
    @guessed.each { |g| return true if g == guess }; false
  end

  def found?(guess)
    return true if in_puzzle?(guess) && !guessed?(guess); false
  end

end


