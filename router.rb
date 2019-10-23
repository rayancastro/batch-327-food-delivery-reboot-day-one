class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running do
      @employee = @sessions_controller.sign_in unless @employee
      if @employee.role == "manager"
        display_manager_menu
        choice = ask_user_for_an_action
        print `clear`
        route_manager_action(choice)
      else
        display_delivery_guy_menu
        choice = ask_user_for_an_action
        print `clear`
        route_delivery_guy_action(choice)
      end
    end
  end

  private

  def display_manager_menu
    puts "--------------------"
    puts "--------MENU--------"
    puts "--------------------"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "8 - Sign out"
    puts "9 - Exit the program"
  end

  def ask_user_for_an_action
    puts "What do you want?"
    print "> "
    gets.chomp.to_i
  end

  def route_manager_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 8 then @employee = nil
    when 9 then @running = false
    else
      puts "Invalid option. Try again."
    end
  end

  def display_delivery_guy_menu
    puts "--------------------"
    puts "--------MENU--------"
    puts "--------------------"
    puts "1 - List my orders [TO-DO]"
    puts "2 - Mark an order as delivered [TO-DO]"
    puts "8 - Sign out"
    puts "9 - Exit the program"
  end

  def route_delivery_guy_action(choice)
    case choice
    when 1 then # TO DO
    when 2 then # TO DO
    when 8 then @employee = nil
    when 9 then @running = false
    else
      puts "Invalid option. Try again."
    end
  end
end
