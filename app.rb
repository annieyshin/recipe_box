require("bundler/setup")
Bundler.require(:default)
require('pry')

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
  @ingredients = Ingredient.all
  erb(:recipe_edit)
end

post('/recipes/:id/edit') do
  # @instructions = Instructions.create({:instructions => instructions})
  ingredient = params.fetch("ingredient")

  #when you submit, you get a hash, the key values are ingredient, amount, and unit. When you put in radish, the key would be ingredient
  @ingredient = Ingredient.create({:name => name})
end

patch('/recipes/:id/edit') do
  ingredient_id = params.fetch("ingredient").to_i
  ingredient = Ingredient.find(ingredient_id)
  amount = params.fetch("amount").to_i
  unit = params.fetch("unit")
  id = params.fetch(:id).to_i
  @recipe = Recipe.find(id)
  @recipe.recipe_ingredients.create({:ingredient => ingredient, :amount => amount, :unit => unit})
  binding.pry
  @ingredients = Ingredient.all
  erb(:recipe_edit)
end

post('/recipes/ingredients/new') do
  ingredient_name = params.fetch('new_ingredient_name')
  new_ingredient = Ingredient.create({:name => ingredient_name})
  redirect back
end
