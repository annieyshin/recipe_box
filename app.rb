require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/recipes') do
  @recipes = Recipe.all
  erb(:recipes)
end

get('/recipes/new') do
  @recipes = Recipe.all
  erb(:recipe_form)
end

post('/recipes') do
  name = params.fetch('name')
  @recipe = Recipe.create({:name => name})
  @recipes = Recipe.all
  erb(:recipes)
end

get('/recipes/:id') do
  id = params.fetch(:id)
  @recipe = Recipe.find(id)
  erb(:recipe)
end
