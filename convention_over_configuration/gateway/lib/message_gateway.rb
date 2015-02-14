# 規約
#  - アダプタクラスは <protocol>Adapter と命名し、adapterディレクトリに配置すること
#  - 許可クラスは <destination_host>Authorizer と命名し、authディレクトリに配置すること
#  - ホストに対して 一般ポリシーにauthorized?メソッドに実装する。
#    所定のユーザーに対する特別ポリシーを持たせるならば<user>_authorized?メソッドを実装する
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

  def camel_case(string)
    tokens = string.split '.'
    tokens.map! { |t| t.capitalize }
    tokens.join('Dot')
  end

  def worm_case(string)
    tokens = string.split '.'
    tokens.map! { |t| t.downcase }
    tokens.join('_dot_')
  end

  def authrizer_for(message)
    to_host = message.to.host || 'default'
    authorizer_name = "#{camel_case(to_host)}Authorizer"
    authorizer_class = self.class.const_get(authorizer_name)
    authorizer_class.new
  end

  def authorized?(message)
    authorizer = authrizer_for(message)
    user_method = "#{worm_case(message.from)}_authorized?"
    if authorizer.respond_to? user_method
      return authorizer.send(user_method, message)
    end
    authorizer.authorized?(message)
  end
end
