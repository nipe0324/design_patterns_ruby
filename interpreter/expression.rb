require 'find'

class Expression
  def all
    All.new
  end

  def name(pattern)
    FileName.new(pattern)
  end

  def bigger(size)
    Bigger.new(size)
  end

  def writable
    Writable.new
  end

  def except(expression)
    Not.new(expression)
  end

  def |(other)
    Or.new(self, other)
  end

  def &(other)
    And.new(self, other)
  end
end
