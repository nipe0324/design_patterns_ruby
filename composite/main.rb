require 'make_cake_task'

make_cake = MakeCakeTask.new

puts "工程    : #{make_cake.name}"
puts "作成時間: #{make_cake.get_time_required}"
puts "工程数  : #{make_cake.total_number_basic_tasks}"

# 葉やCompositeからルートまでたどる
# task = make_cake[0][0] # AddDryIngredientsTask
# while task
#   puts "task: #{task.class}"
#   task = task.parent
# end
# => Output
# task: AddDryIngredientsTask
# task: MakeBatterTask
# task: MakeCakeTask