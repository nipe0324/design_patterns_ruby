class TextObject
  attr_reader :text, :size_inches, :color

  def initialize(text, size_inches, color)
    @text, @size_inches, @color = text, size_inches, color
  end
end