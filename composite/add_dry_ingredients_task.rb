require 'task'

# Leaf
class AddDryIngredientsTask < Task
  def initialize
    super 'Add dry ingredients'
  end

  def get_time_required
    1.0 # 小麦粉と砂糖を加えるのに1分かかる
  end
end