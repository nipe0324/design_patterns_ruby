require 'task'

# Leaf
class AddLiquidsTask < Task
  def initialize
    super 'Add liquids'
  end

  def get_time_required
    2.0 # 1分かかる
  end
end