class String  
  def possessive
    self + ('s' == self[-1,1] ? "'" : "'s")
  end
end