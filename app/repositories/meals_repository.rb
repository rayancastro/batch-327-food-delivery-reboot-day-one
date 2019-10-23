require_relative 'base_repository'

class MealsRepository < BaseRepository

  private

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_f

    Meal.new(row)
  end
end
