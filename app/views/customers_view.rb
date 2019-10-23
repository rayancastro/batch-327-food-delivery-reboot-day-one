require_relative 'base_view'

class CustomersView < BaseView
  def display_customers(customers)
    puts "customers List"
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} (#{customer.address})"
    end
  end
end
