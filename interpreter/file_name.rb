require 'expression'

class FileName < Expression
  def initialize(pattern)
    @pattern = pattern
  end

  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file? p
      name = File.basename p
      results << p if File.fnmatch(@pattern, name)
    end

    results
  end
end
