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

  # オブジェクトの妥当性を保証できる
  def computer
    raise "メモリ容量が十分でありません" if @computer.motherboard.memory_size < 250
    raise "ドライブが多すぎます"       if @computer.drives.size > 4
    hard_disk = @computer.drives.find { |drive| drive.type == :hard_disk }
    raise "ハードディスクがありません"  unless hard_disk
    @computer
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

  # マジックメソッド
  #   次のようなメソッドを定義することができる
  #   - builder.add_dvd_and_harddisk
  #   - builder.add_turbo_and_dvd_and_harddisk
  def method_missing(name, *args)
    words = name.to_s.split "_"
    return super(name, *args) unless words.shift == 'add'
    words.each do |word|
      next    if word == 'and'
      add_cd  if word == 'cd'
      add_dvd if word == 'dvd'
      turbo   if word == 'turbo'
      add_hard_disk(100000) if word == 'harddisk'
    end
  end
end