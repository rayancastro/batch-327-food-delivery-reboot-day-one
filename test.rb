require_relative 'app/models/meal'
require_relative 'app/repositories/meals_repository'


csv_file = './data/meals.csv'

repo = MealsRepository.new(csv_file)

p repo.all


vintoso = Meal.new(name: "Prato do dia", price: 23)

repo.add(vintoso)

p repo.all
