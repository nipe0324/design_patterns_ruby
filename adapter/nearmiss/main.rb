require 'british_text_object'

# BritishTextObjectのアダプタを作る代わりに
# 元のBritishTextObjectにメソッドを追加している
class BritishTextObject
  def text
    string
  end

  def size_inches
    size_mm / 25.4
  end

  def color
    colour
  end
end


# 上記はBritishTextObjectクラス自体を修正している
# 特定のBritishTextObjectインスタンスのみを変更するソフトな方法もある
bto = BritishTextObject.new('hello', 50.8, :blue)

class << bto
  def text
    string
  end

  def size_inches
    size_mm / 25.4
  end

  def color
    colour
  end
end