require 'csv'

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @elements
  end

  def add(element)
    element.id = @next_id
    @elements << element
    update_csv
    @next_id += 1
  end

  private

  def update_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << @elements.first.class.headers

      @elements.each do |element|
        csv << element.to_csv_row
      end
    end
  end

  def load_csv
    options = {
      headers: :first_row,
      header_converters: :symbol
    }

    CSV.foreach(@csv_file, options) do |row|
      @elements << build_element(row)
    end
    @next_id = ( @elements.empty? ? 1 : @elements.last.id + 1 )
  end
end
