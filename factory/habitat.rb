class Habitat
  def initialize(number_animals, animal_class, number_plants, plant_class)
    @animal_class = animal_class
    @plant_class  = plant_class

    @animals = []
    number_animals.times do |i|
      animal = new_organism :animal, "動物#{i}"
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = new_organism :plant, "植物#{i}"
      @plants << plant
    end
  end

  def simulate_one_day
    @animals.each(&:speak)
    @animals.each(&:eat)
    @animals.each(&:sleep)
    @plants.each(&:grow)
  end

  def new_organism(type, name)
    if type == :animal
      @animal_class.new(name)
    elsif type == :plant
      @plant_class.new(name)
    else
      raise "Unknown organism type: #{type}"
    end
  end
end