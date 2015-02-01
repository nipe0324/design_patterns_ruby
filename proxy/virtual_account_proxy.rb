# 仮装プロキシ
# 作成コストがかかるオブジェクトの生成を本当に必要になるまで遅延できる
#
# subjectメソッドで、BankAccountオブジェクトが既に生成済みかチェックし、
# もしまだ精製されていなければ新しいオブジェクトを作る
class VirtualAccountProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def method_missing(name, *args)
    s = subject
    s.send(name, *args)
  end

  def subject
    @subject || (@subject = @creation_block.call)
  end
end