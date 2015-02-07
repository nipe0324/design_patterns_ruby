require 'expression'

class Bigger < Expression
  def initialize(size)
    @size = size
  end

  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file? p
      results << p if File.size(p) > @size
    end

    results
  end
end
