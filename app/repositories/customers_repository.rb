require_relative 'base_repository'

class CustomersRepository < BaseRepository

  private

  def build_element(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end
end
