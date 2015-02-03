require 'duck_water_lily_pond'
require 'frog_algae_pond'

pond1 = DuckWaterLilyPond.new(3, 2)
pond1.simulate_one_day

pond2 = FrogAlgaePond.new(3, 2)
pond2.simulate_one_day
