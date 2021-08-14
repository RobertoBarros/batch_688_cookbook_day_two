class ScrapeAllrecipesService
  def initialize(keyword)
    @keyword = keyword
    @view = View.new
  end

  def call
    url = URI.escape("https://www.allrecipes.com/search/results/?search=#{@keyword}")
    doc = Nokogiri::HTML(URI.open(url).read, nil, 'utf-8')

    names = []
    links = []
    doc.search('.card__recipe').first(5).each do |card|
      names << card.search('h3.card__title').text.strip
      links << card.search('.card__titleLink').first.attribute('href').value
    end

    @view.display_recipe_names(names)

    index = @view.ask_index

    url = links[index]
    doc = Nokogiri::HTML(URI.open(url).read, nil, 'utf-8')

    name = doc.search('h1').text.strip
    description = doc.search('.recipe-summary').text.strip
    rating = doc.search('.review-star-text').first.text.strip.match(/Rating: (\d)/)[1].to_i
    prep_time = doc.search('.recipe-meta-item-body')[2].text

    Recipe.new(name, description, rating, prep_time)
  end
end