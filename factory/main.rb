require 'habitat'
require 'tiger'
require 'tree'
require 'duck'
require 'water_lily'

jungle = Habitat.new(1, Tiger, 4, Tree)
jungle.simulate_one_day

pond = Habitat.new(3, Duck, 2, WaterLily)
pond.simulate_one_day
