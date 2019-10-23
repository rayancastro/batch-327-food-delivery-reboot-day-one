class MealsView
  def display_meals(meals)
    puts "Meals List"
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} (R$#{meal.price})"
    end
  end

  def ask_for(stuff)
    puts "What's the #{stuff}?"
    print "> "
    gets.chomp
  end
end
