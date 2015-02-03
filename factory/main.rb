require 'duck'
require 'water_lily'
require 'pond'

pond = Pond.new(3, Duck, 2, WaterLily)
pond.simulate_one_day
