require 'enhance_writer'
require 'simple_writer'
require 'check_summing_writer'
require 'time_stamping_writer'
require 'numbering_writer'

# デコレーターを使う前
writer = EnhanceWriter.new 'out.txt'

writer.write_line '飾り気のない一行'

writer.checksumming_write_line 'チェックサム付き'
puts "チェックサムは #{writer.check_sum}"

writer.timestamping_write_line 'タイムスタンプ付き'

writer.numbering_write_line '行番号付き'
writer.numbering_write_line '行番号付き'

writer.close

# デコレーターを利用
writer2 = CheckSummingWriter.new(
           TimeStampingWriter.new(
             NumberingWriter.new(
               SimpleWriter.new('final.txt')
             )
           )
         )
writer2.write_line 'Hello out there'
writer2.write_line 'Good evening'
puts "チェックサムは #{writer2.check_sum}"
writer2.close


# ラッピングメソッド
writer3 = SimpleWriter.new 'rapping.txt'

class << writer3

  # write_lineに別名のoriginal_write_lineを作成する
  alias original_write_line write_line

  # write_lineをオーバーライドする
  # original_write_lineは昔のwrite_lineを指している
  def write_line(line)
    original_write_line "#{Time.now}: #{line}"
  end
end

writer3.write_line "タイムスタンプ付き"
