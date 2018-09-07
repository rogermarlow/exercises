class Tower
  def initialize(n)
    # Call with n==0 for empty tower
    raise 'Tried to create tower with less than zero discs' if n<0
    @tower = Array(1..n).reverse
  end

  def empty?
    @tower.empty?
  end
  
  def get_top_disc
    raise 'Tried to get disc from empty tower' if @tower.empty?
    @tower.pop
  end

  def add_disc(d)
    raise 'Tried to put bigger disc on smaller one' if @tower.last && d >= @tower.last
    @tower.push(d)
    self
  end

  def print
    if @tower.empty? then
      return "."
    else
      @tower.join('-')
    end
  end

  def height
    @tower.size
  end

  def ==(other)
    case other
    when Tower
      self.print == other.print
   when Array
      @tower.eql?(other)
    else
      raise "Given #{other.class} which is incomparable to a Tower"
    end
  end
end
