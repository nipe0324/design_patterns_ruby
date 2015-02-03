class Duck
  def initialize(name)
    @name = name
  end

  def eat
    puts "アヒル #{@name} は食事中です。"
  end

  def speak
    puts "アヒル #{@name} がガーガー鳴いています。"
  end

  def sleep
    puts "アヒル #{@name} は静かに眠っています。"
  end
end
