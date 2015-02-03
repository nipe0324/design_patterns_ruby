# require 'motherboard'
# require 'drive'
# require 'cpu'
# require 'computer'

# # ビルダー導入前
# # たくさんのメモリを積んだ高速なコンピューターを組み立てます
# motherboard = Motherboard.new(TurboCPU.new, 4_000)

# # ハードティスク、CDライタ、DVDドライブを追加します
# drives = []
# drives << Drive.new(:hard_drive, 200_000, true)
# drives << Drive.new(:cd,             760, true)
# drives << Drive.new(:dvd,          4_700, false)

# computer = Computer.new(:lcd, motherboard, drives)


# ビルダー導入後
require 'computer_builder'

builder = ComputerBuilder.new
builder.turbo
builder.add_cd(true)
builder.add_dvd
builder.add_hard_disk(100_000)
computer = builder.computer
