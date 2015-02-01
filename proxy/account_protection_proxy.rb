require 'etc'

# 防御プロキシ
# 口座に対する各操作はcheck_accessメソッドの呼び出しにより保護される
# BankAccountクラスに直接アクセス制御(check_access)を追加もできるが、
# プロキシに追加したほうが関心事の分離を上手く行える
class AccountProtectionProxy
  def initialize(real_account, owner_name)
    @subject, @owner_name = real_account, owner_name
  end

  def method_missing(name, *args)
    check_access
    @subject.send(name, *args)
  end

  def check_access
    raise "Illegal access: #{Etc.getlogin} cannot access account" if Etc.getlogin != @owner_name
  end
end
