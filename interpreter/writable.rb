require 'expression'

class Writable < Expression
  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file? p
      results << p if File.writable? p
    end
    results
  end
end
