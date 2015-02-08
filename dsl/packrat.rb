require 'finder'
require 'backup'
require 'data_source'

def backup(dir, find_expression = All.new)
  Backup.instance.data_sources << DataSource.new(dir, find_expression)
end

def to(backup_directory)
  Backup.instance.backup_directory = backup_directory
end

def interval(minutes)
  Backup.instance.interval = minutes
end

def method_missing(name, *args)
  Expression.new.send(name, *args)
end

eval(File.read('backup.pr'))
Backup.instance.run
