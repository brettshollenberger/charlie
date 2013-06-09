class Letter < String
  attr_accessor :display, :secret
  def initialize(letter)
    @display = "_"
    @secret = letter
  end
end
