require 'pond'
require 'frog'
require 'algae'

class FrogAlgaePond < Pond
  def new_animal(name)
    Frog.new(name)
  end

  def new_plant(name)
    Algae.new(name)
  end
end
