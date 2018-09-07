class Reverser  
  def reverse(s)
    if s.length == 1
      return s
    else
      return reverse(tail(s)) + head(s)
    end
  end

  private

  def head(s)
    s[0]
  end
  
  def tail(s)
    s[1..s.length]
  end
end
