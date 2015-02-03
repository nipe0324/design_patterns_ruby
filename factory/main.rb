require 'habitat'
require 'jungle_organism_factory'
require 'pond_organism_factory'

jungle = Habitat.new(1, 4, JungleOrganismFactory.new)
jungle.simulate_one_day

pond = Habitat.new(3, 2, PondOrganismFactory.new)
pond.simulate_one_day
