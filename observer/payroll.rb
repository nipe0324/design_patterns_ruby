class Payroll
  def update(changed_employee)
    puts "#{changed_employee.name}のための小切手を切ります"
    puts "彼の給料はいま#{changed_employee.salary}です"
  end
end