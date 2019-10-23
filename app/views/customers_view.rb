class CustomersView
  def display_customers(customers)
    puts "customers List"
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} (#{customer.address})"
    end
  end

  def ask_for(stuff)
    puts "What's the #{stuff}?"
    print "> "
    gets.chomp
  end
end
