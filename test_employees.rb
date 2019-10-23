require_relative 'app/models/employee'
require_relative 'app/repositories/employees_repository'


csv_file = './data/employees.csv'

repo = EmployeesRepository.new(csv_file)

p repo
