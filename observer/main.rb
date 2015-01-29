require 'employee'
require 'payroll'
require 'tax_man'

fred = Employee.new('Fred Flintstone', 'Crane Operator', 30_000)

payroll = Payroll.new
fred.add_observer payroll

tax_man = TaxMan.new
fred.add_observer tax_man

# フレッドを昇給させる
fred.salary = 35_000