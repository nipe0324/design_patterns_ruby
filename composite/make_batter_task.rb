require 'task'
require 'composite_task'
require 'add_dry_ingredients_task'
require 'add_liquids_task'
require 'mix_task'

# Composite
class MakeBatterTask < CompositeTask
  def initialize
    super 'Make batter'
    self << AddDryIngredientsTask.new
    self << AddLiquidsTask.new
    self << MixTask.new
  end
end