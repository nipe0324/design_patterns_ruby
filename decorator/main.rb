require 'enhance_writer'

writer = EnhanceWriter.new 'out.txt'

writer.write_line '飾り気のない一行'

writer.checksumming_write_line 'チェックサム付き'
puts "チェックサムは #{writer.check_sum}"

writer.timestamping_write_line 'タイムスタンプ付き'

writer.numbering_write_line '行番号付き'
writer.numbering_write_line '行番号付き'
