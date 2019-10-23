require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # Ask user for username (view)
    username = @view.ask_for(:username)
    # Ask user for password (view)
    password = @view.ask_for(:password)
    # Find the employee by his username (employee repo)
    employee = @employee_repository.find_by_username(username)
    # Compare the password
    if employee && employee.password == password
      # Yay, logged in
      @view.signed_in_successfully(employee)
      return employee
    else
      @view.wrong_credentials
      sign_in   # Recursive Call
    end
  end
end
