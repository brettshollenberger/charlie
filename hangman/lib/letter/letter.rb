class Letter < String
  attr_accessor :display, :secret
  
  def initialize(letter)
    @display = "_"
    @secret = letter
  end

  def solved?
    @display == @secret
  end

  def unsolved?
    !solved?
  end
end
