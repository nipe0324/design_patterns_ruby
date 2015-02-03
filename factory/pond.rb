# 池クラス
class Pond
  def initialize(number_animals, number_plants)
    @animals = []
    number_animals.times do |i|
      animal = new_animal "動物#{i}"
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = new_plant "植物#{i}"
      @plants << plant
    end
  end

  def simulate_one_day
    @animals.each(&:speak)
    @animals.each(&:eat)
    @animals.each(&:sleep)
    @plants.each(&:grow)
  end
end