require 'command'

class DeleteFile < Command
  def initialize(path)
    super("Delete file: #{path}")
    @path = path
  end

  def execute
    # NOTE 実際のシステムでは一時ディレクトリへファイルの内容をコピーする
    if File.exists?(@path)
      @contents = File.read(@path)
    end
    File.delete(@path)
  end

  def unexecute
    if @contents
      f = File.open(@path, "w")
      f.write(@contents)
      f.close
    end
  end
end
