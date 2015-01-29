require 'employee'
require 'payroll'

fred = Employee.new('Fred Flintstone', 'Crane Operator', 30_000)

payroll = Payroll.new
fred.add_observer payroll

# フレッドを昇給させる
fred.salary = 35_000