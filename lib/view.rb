class View

  def ask_name
    puts "Enter recipe name:".green
    gets.chomp
  end

  def ask_description
    puts "Enter recipe description".green
    gets.chomp
  end

  def ask_rating
    puts "Enter recipe rating".green
    gets.chomp.to_i
  end

  def ask_prep_time
    puts "Enter preparation Time:".green
    gets.chomp
  end

  def ask_index
    puts "Enter recipe index:".red
    gets.chomp.to_i - 1
  end

  def ask_ingredient
    puts "Enter ingredient of recipe:"
    gets.chomp
  end

  def display(recipes)
    puts '-'.red * 60
    recipes.each_with_index do |recipe, index|
      done = recipe.done? ? '[X]' : '[ ]'
      puts "#{index + 1} - #{done} #{recipe.name}: #{recipe.description} - (rating: #{recipe.rating}/5) Prep. Time: #{recipe.prep_time}".blue
    end
    puts '-'.red * 60
  end

  def display_recipe_names(names)
    names.each_with_index do |name, index|
      puts "#{index + 1} - #{name}"
    end
  end

end