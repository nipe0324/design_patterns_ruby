# 規約
#  - アダプタクラスは <protocol>Adapter と命名し、adapterディレクトリに配置すること


class MessageGateway
  def initialize
    load_adapters
  end

  def process_message(message)
    adapter = adapter_for(message)
    adapter.send_message(message)
  end

  # アダプタを選択するメソッド
  # 'http'から'HttpAdapter'というように、メッセージから宛先のプロトコルを取り出し、アダプタ名を取得する
  def adapter_for(message)
    protocol = message.to.schema.downcase # http, smtp, fileなどのプロトコルを取得
    adapter_name = "#{protocol.capitalize}Adapter" # アダプタクラス名に変更
    adapter_class = self.class.const_get(adapter_name) # const_getでアダプタクラスを取得する
    adapter_class.new # アダプタオブジェクを生成して返す
  end

  # アダプタクラスのロード
  def load_adapters
    lib_dir = File.dirname(__FILE__)  # __FILE_は現在のソースファイルのパスが設定されているので、libのパスを取得
    full_pattern = File.join(lib_dir, 'adapter', '*.rb') # lib/adapter/*.rbのようなパスを作成する
    Dir.glob(full_pattern).each { |file| require file } # パターンにマッチするファイル名を文字列の配列として返す
  end
end
