require 'task'

# Composite
class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def <<(task)
    @sub_tasks << task
    task.parent = self
  end

  def [](index)
    @sub_tasks[index]
  end

  def []=(index, new_value)
    @sub_tasks[index] = new_value
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    @sub_tasks.inject(0.0) { |sum, task| sum += task.get_time_required }
  end

  def total_number_basic_tasks
    @sub_tasks.inject(0) { |sum, task| sum += task.total_number_basic_tasks }
  end
end