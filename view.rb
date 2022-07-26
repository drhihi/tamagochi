module View

  def self.type(types)
    self.clear_screen
    types.each.with_index { |el, i| puts "#{i+1}. #{el}" }
    puts "enter entity type: "
    gets.to_i - 1
  end

  def self.action(actions)
    actions.each.with_index { |el, i| puts "#{i+1}. #{el}" }
    puts "enter action: "
    gets.to_i - 1
  end

  def self.food(foods)
    foods.each.with_index { |el, i| puts "#{i+1}. #{ el[:name] }" }
    puts "enter food: "
    gets.to_i - 1
  end

  def self.game_over(entity)
    say entity
    puts "💀"
  end

  def self.name
    self.clear_screen
    puts "enter entity name: "
    gets.chomp
  end

  def self.say(entity)
    puts "\033[1;36m#{entity.voice}\033[0m\n"
  end

  def self.info(entity)
    self.clear_screen
    puts entity.info
  end

  private

  def self.clear_screen
    puts "\033[H\033[2J"
  end

end

