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

get('/recipes/:id/edit') do
  id = params.fetch(:id)
  @recipe = Recipe.find(id)
  erb(:recipe_edit)
end

post('/recipes/:id/edit') do
  # @instructions = Instructions.create({:instructions => instructions})
  ingredient = params.fetch("ingredient")
  amount = params.fetch("amount")
  unit = params.fetch("unit")
  #when you submit, you get a hash, the key values are ingredient, amount, and unit. When you put in radish, the key would be ingredient
  @ingredient = Ingredient.create({:name => name})
