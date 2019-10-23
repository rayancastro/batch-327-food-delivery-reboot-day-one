require_relative 'base_view'

class MealsView < BaseView
  def display_meals(meals)
    puts "Meals List"
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} (R$#{meal.price})"
    end
  end
end
