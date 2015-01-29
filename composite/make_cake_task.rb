require 'task'
require 'composite_task'
require 'make_batter_task'

# Composite
class MakeCakeTask < CompositeTask
  def initialize
    super 'Make Cake'
    self << MakeBatterTask.new
  end
end