require 'uri'

class Message
  attr_accessor :from, :to, :body

  def initialize(from, to, body)
    @from = from # shoji.yanagi' のような単純な文字列で誰からメッセージが送られたか
    @to   = to   # URIでどこにメッセージを届けるか
    @body = body # 実際のメッセージ文字列
  end
end
