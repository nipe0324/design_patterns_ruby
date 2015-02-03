require 'cpu'

class Motherboard
  attr_accessor :cpu
  attr_accessor :memory_size

  def initialize(cpu = BasicCPU.new, memory_size = 1000)
    @cpu, @memory_size = cpu, memory_size
  end
end
