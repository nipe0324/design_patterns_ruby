class Drive
  attr_reader :type     # :hard_disk か :cd か :dvd
  attr_reader :size     # MB
  attr_reader :writable # ドライブが書き込み可能ならばt rue

  def initialize(type, size, writable)
    @type, @size, @writable = type, size, writable
  end
end