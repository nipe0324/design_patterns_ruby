require 'computer'
require 'cpu'
require 'drive'

class ComputerBuilder
  attr_reader :computer

  def initialize
    @computer = Computer.new
  end

  def turbo(has_turbo_cpu = true)
    @computer.motherboard.cpu = TurboCPU.new
  end

  def display=(display)
    @computer.display = display
  end

  def memory_size=(size_in_mb)
    @computer.motherboard.memory_size = size_in_mb
  end

  def add_cd(writable = false)
    @computer.drives << Drive.new(:cd, 760, writable)
  end

  def add_dvd(writable = false)
    @computer.drives << Drive.new(:dvd, 4_000, writable)
  end

  def add_hard_disk(size_in_mb)
    @computer.drives << Drive.new(:hard_disk, size_in_mb, true)
  end
end