require 'all'
require 'file_name'

# すべてのファイル名を取得
expr_all = All.new
files = expr_all.evaluate('test_dir')
p "files: #{files}"

# ファイル名が"*.mp3"に合致するファイル名を取得
expr_mp3 = FileName.new('*.mp3')
mp3s = expr_mp3.evaluate('test_dir')
p "mp3s: #{mp3s}"
