require 'command'
require 'fileutils'

class CopyFile < Command
  def initialize(source, target)
    super("Copy file: #{source} to #{target}")
    @source, @target = source, target
  end

  def execute
    # NOTE 実際のシステムでは一時ディレクトリへファイルの内容をコピーする
    if File.exists?(@target)
      @contents = File.read(@target)
    end
    FileUtils.copy(@source, @target)
  end

  def unexecute
    File.delete(@target)
    if @contents
      f = File.open(@target, "w")
      f.write(@contents)
      f.close
    end
  end
end
