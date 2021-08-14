# MODEL
class Recipe
  attr_reader :name, :description, :rating, :prep_time

  def initialize(name, description, rating, prep_time)
    @name = name
    @description = description
    @rating = rating
    @prep_time = prep_time
    @done = false
  end

  def done?
    @done
  end

  def done!
    @done = true
  end
end




# attributes = {name: 'Feijoada', description: 'feijão'}
# Recipe.new(attributes)

# Recipe.new({name: 'Feijoada', description: 'feijão'})
# Recipe.new(name: 'Feijoada', description: 'feijão')

