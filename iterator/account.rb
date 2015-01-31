# Enumerableの実装例
class Account
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name, @balance = name, balance
  end

  def <=>(other)
    balance <=> other.balance
  end
end