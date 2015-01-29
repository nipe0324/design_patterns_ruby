require 'employee'
require 'payroll'

payroll = Payroll.new
fred = Employee.new('Fred Flintstone', 'Crane Operator', 30_000, payroll)

# フレッドを昇給させる
fred.salary = 35_000