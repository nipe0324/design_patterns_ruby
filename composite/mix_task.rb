require 'task'

# Leaf
class MixTask < Task
  def initialize
    super 'Mix that batter up!'
  end

  def get_time_required
    3.0 # 混ぜるのに3分かかる
  end
end