class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true

  end

  def run
    while @running do
      # Display menu
      display_menu
      # Ask user to choose an action
      choice = ask_user_for_an_action
      # Execute the choosen action
      print `clear`
      route_action(choice)
    end
  end

  private

  def display_menu
    puts "--------------------"
    puts "--------MENU--------"
    puts "--------------------"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "9 - Exit the program"
  end

  def ask_user_for_an_action
    puts "What do you want?"
    print "> "
    gets.chomp.to_i
  end

  def route_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then @running = false
    else
      puts "Invalid option. Try again."
    end
  end
end
