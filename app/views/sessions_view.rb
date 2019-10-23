require_relative 'base_view'

class SessionsView < BaseView
  def wrong_credentials
    puts "Wrong credentials... Try again"
  end

  def signed_in_successfully(employee)
    puts "Welcome #{employee.username}!"
  end
end
