# 池クラス
class Pond
  def initialize(number_animals)
    @animals = []
    number_animals.times do |i|
      animal = new_animal "動物#{i}"
      @animals << animal
    end
  end

  def simulate_one_day
    @animals.each(&:speak)
    @animals.each(&:eat)
    @animals.each(&:sleep)
  end
end