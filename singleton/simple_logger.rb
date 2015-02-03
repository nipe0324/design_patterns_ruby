require 'singleton'

class SimpleLogger
  include Singleton

  attr_accessor :level

  ERROR = 1
  WARNING = 2
  INFO = 3

  def initialize
    @log = File.open('log.txt', 'w')
    @level = WARNING
  end

  # Singletonモジュールは、
  # - クラス変数を定義し、
  # - シングルトンインスタンスで初期化し、instanceというクラスメソッドを作り
  # - newメソッドをプライベート化します
  #
  # @@instance = self.new
  #
  # def self.instance
  #   @@instance
  # end
  #
  # private_class_method :new

  def error(msg)
    @log.puts(msg)
    @log.flush
  end

  def warning(msg)
    @log.puts(msg) if @level >= WARNING
    @log.flush
  end

  def info(msg)
    @log.puts(msg) if @level >= INFO
    @log.flush
  end
end