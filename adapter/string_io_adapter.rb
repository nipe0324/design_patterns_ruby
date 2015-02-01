class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def getc
    raise EOFError if @position >= @string.length
    @string[@position].tap { @position += 1 }
  end

  def eof?
    @position >= @string.length
  end
end