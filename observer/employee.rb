require 'payroll'

class Employee
  attr_reader :name
  attr_accessor :title, :salary

  def initialize(name, title, salary, payroll)
    @name, @title, @salary, @payroll = name, title, salary, payroll
  end

  def salary=(new_salary)
    @salary = new_salary
    @payroll.update(self)
  end
end