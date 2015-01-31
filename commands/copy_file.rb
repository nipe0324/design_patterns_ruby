require 'command'
require 'fileutils'

class CopyFile < Command
  def initialize(source, target)
    super("Copy file: #{source} to #{target}")
    @source, @target = source, target
  end

  def execute
    FileUtils.copy(@source, @target)
  end
end
