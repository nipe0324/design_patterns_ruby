require 'create_file'
require 'copy_file'
require 'delete_file'
require 'composite_command'

cmds = CompositeCommand.new

cmds.add_command CreateFile.new('file1.txt', "hello world\n")
cmds.add_command CopyFile.new('file1.txt', 'file2.txt')
cmds.add_command DeleteFile.new('file1.txt')

puts cmds.description

# コマンドを実行
cmds.execute

sleep 3

# コマンドを戻す
cmds.unexecute