class BaseView
  def ask_for(stuff)
    puts "What's the #{stuff}?"
    print "> "
    gets.chomp
  end
end
