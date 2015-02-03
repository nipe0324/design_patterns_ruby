require 'motherboard'
require 'drive'
require 'cpu'
require 'computer'

# たくさんのメモリを積んだ高速なコンピューターを組み立てます

motherboard = Motherboard.new(TurboCPU.new, 4_000)

# ハードティスク、CDライタ、DVDドライブを追加します

drives = []
drives << Drive.new(:hard_drive, 200_000, true)
drives << Drive.new(:cd,             760, true)
drives << Drive.new(:dvd,          4_700, false)

computer = Computer.new(:lcd, motherboard, drives)
