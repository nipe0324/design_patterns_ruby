class Computer
  attr_accessor :display
  attr_accessor :motherboard
  attr_reader :drive

  def initialize(display = :crt, motherboard = Motherboard.new, drives = [])
    @display, @motherboard, @drives = display, motherboard, drives
  end
end
