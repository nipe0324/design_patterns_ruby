require 'pond'
require 'frog'

class FrogPond < Pond
  def new_animal(name)
    Frog.new(name)
  end
end
