require 'encrypter'
require 'string_io_adapter'

# reader = File.open('message.txt')
# writer = File.open('message.encrypted', 'w')
# encrypter = Encrypter.new('XYZZY')
# encrypter.encrypt(reader, writer)
# reader.close
# writer.close

encrypter = Encrypter.new('XYZZY')
reader = StringIOAdapter.new("We attack at dawn")
writer = File.open('out.txt', 'w')
encrypter.encrypt(reader, writer)
