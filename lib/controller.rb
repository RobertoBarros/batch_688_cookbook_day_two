require_relative 'view'
require_relative 'scrape_allrecipes_service'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # 1. Pegar todas as receitas
    recipes = @cookbook.all
    # 2. Mandar a View exibir as receitas
    @view.display(recipes)
  end

  def create
    # 1. Perguntar o name, a description e a nota da Recipe
    name = @view.ask_name
    description = @view.ask_description
    rating = @view.ask_rating
    prep_time = @view.ask_prep_time

    # 2. Criar uma nova instância de Recipe
    new_recipe = Recipe.new(name, description, rating, prep_time)

    # 3. Adicionar ao cookbook
    @cookbook.add_recipe(new_recipe)

    # 4. Listar as receitas
    list
  end

  def destroy
    # 1. Listar todas as receitas
    list

    # 2. Pegar o index da receita a ser excluída
    index = @view.ask_index

    # 3. Pedir ao cookbook que exclua a receita pelo index
    @cookbook.remove_recipe(index)

    # 4. Listar todas as receitas
    list
  end

  def mark_as_done
    # 1. Mostrar todas as receitas
    list
    # 2. Pegar o index da receita a ser marcada como feita
    index = @view.ask_index
    # 3. Pedir ao cookbook que mark a receita como feita
    @cookbook.mark_as_done(index)
    # 4. Mostrar todas as receitas
    list
  end

  def import
    ingredient = @view.ask_ingredient
    scrape = ScrapeAllrecipesService.new(ingredient)
    new_recipe = scrape.call

    @cookbook.add_recipe(new_recipe)
  end
end
