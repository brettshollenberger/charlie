class Letter < String
  attr_reader :display, :secret
  def initialize(letter)
    @display = "_"
    @secret = letter
  end
end
