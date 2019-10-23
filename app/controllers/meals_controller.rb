require_relative '../views/meals_view'

class MealsController
  def initialize(meals_repository)
    @meals_repository = meals_repository
    @view = MealsView.new
  end

  def list
    # Get the meals from the repo
    meals = @meals_repository.all
    # Ask view to display the meals
    @view.display_meals(meals)
  end

  def add
    # Ask user for a name (view)
    name = @view.ask_for(:name)
    # Ask user for a price (view)
    price = @view.ask_for(:price).to_f
    # Instantiate my meal with name and price (model)
    new_meal = Meal.new(name: name, price: price)
    # Store the meal (repo)
    @meals_repository.add(new_meal)
  end
end
