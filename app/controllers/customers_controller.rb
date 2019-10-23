require_relative '../views/customers_view'

class CustomersController
  def initialize(customers_repository)
    @customers_repository = customers_repository
    @view = CustomersView.new
  end

  def list
    # Get the customers from the repo
    customers = @customers_repository.all
    # Ask view to display the customers
    @view.display_customers(customers)
  end

  def add
    # Ask user for a name (view)
    name = @view.ask_for(:name)
    # Ask user for a address (view)
    address = @view.ask_for(:address)
    # Instantiate my customer with name and address (model)
    new_customer = Customer.new(name: name, address: address)
    # Store the customer (repo)
    @customers_repository.add(new_customer)
  end
end
