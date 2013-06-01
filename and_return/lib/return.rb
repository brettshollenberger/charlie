class Returns
  public :gets
  def ask
    a = gets.chomp
    return a.to_i
  end
end
