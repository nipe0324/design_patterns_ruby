require 'expression'

class And < Expression
  def initialize(expr1, expr2)
    @expr1, @expr2 = expr1, expr2
  end

  def evaluate(dir)
    result1 = @expr1.evaluate(dir)
    result2 = @expr2.evaluate(dir)
    (result1 & result2)
  end
end
