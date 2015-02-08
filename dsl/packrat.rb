require 'finder'

def backup(dir, find_expression = All.new)
  puts "Backup called, souce dir = #{dir} find expr=#{find_expression}"
end

def to(backup_directory)
  puts "To called, backup dir = #{backup_directory}"
end

def interval(minutes)
  puts "Interval called, interval = #{minutes} minutes"
end

def method_missing(name, *args)
  Expression.new.send(name, *args)
end

eval(File.read('backup.pr'))
