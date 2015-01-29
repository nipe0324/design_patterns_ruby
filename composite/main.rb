require 'make_cake_task'

make_cake = MakeCakeTask.new
puts make_cake.get_time_required



# 葉やCompositeからルートまでたどる
task = make_cake[0][0] # AddDryIngredientsTask
while task
  puts "task: #{task.class}"
  task = task.parent
end
# => Output
# task: AddDryIngredientsTask
# task: MakeBatterTask
# task: MakeCakeTask