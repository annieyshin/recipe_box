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

get('/ingredients/new') do
  @ingredients = Ingredient.all
  erb(:ingredients)
end

get('/categories') do
  @categories = Category.all
  erb(:categories)
end

          # get('/categories/add') do
          #   @categories = Category.all
          #   erb(:categories)
          # end

          get('/categories/:id') do
            id = params.fetch(:id)
            @category = Category.find(id)
            @recipes = Recipe.all
            erb(:category)
          end

post('/categories/add') do
  category_id = params.fetch('category_id').to_i
  recipe_id = params.fetch('recipe_id').to_i
  @recipe = Recipe.find(recipe_id)
  category = Category.find(category_id)
  @recipe.categories.push(category)
  @categories = Category.all
  redirect back
end

post('/categories') do
  name = params.fetch("name")
  @categories = Category.create({:name => name})
  @categories = Category.all
  erb(:categories)
end

post('/ingredients/new') do
  name = params.fetch('name')
  @ingredient = Ingredient.create({:name => name})
  @ingredients = Ingredient.all
  erb(:ingredients)
end

# post('/ingredients') do
#   name = params.fetch('name')
#   @ingredients = Ingredient.create({:name => name})
#   @ingredients = Ingredient.all
#   erb(:ingredients)
# end


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
  @categories = Category.all
  erb(:recipe_edit)
end

post('/recipes/:id/edit') do
  instruction = params.fetch(:instruction)
  id = params.fetch(:id)
  @categories = Category.all
  @recipe = Recipe.find(id)
  @recipe.update({:instruction => instruction})
  @ingredients = Ingredient.all
  erb(:recipe_edit)
  #when you submit, you get a hash, the key values are ingredient, amount, and unit. When you put in radish, the key would be ingredient
end

patch('/recipes/:id/edit') do
  ingredient_id = params.fetch("ingredient").to_i
  ingredient = Ingredient.find(ingredient_id)
  amount = params.fetch("amount").to_i
  unit = params.fetch("unit")
  id = params.fetch(:id).to_i
  @recipe = Recipe.find(id)
  @recipe.recipe_ingredients.create({:ingredient => ingredient, :amount => amount, :unit => unit})
  @ingredients = Ingredient.all
  erb(:recipe_edit)
end

delete('/recipes/:id/edit') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  recipe_ingredients = RecipeIngredient.where(recipe_id: @recipe.id)
  recipe_ingredients.destroy(recipe_ingredients.ids)

# @category = Category.find(params.fetch("id").to_i)
# categories_recipes = CategoryRecipe.where(categories_id: @category.id)
# categories_recipes.destroy(categories_recipes.ids)
  @recipe.categories.destroy
  @recipe.destroy

  redirect("/recipes")


end


post('/recipes/ingredients/new') do
  ingredient_name = params.fetch('new_ingredient_name')
  new_ingredient = Ingredient.create({:name => ingredient_name})
  redirect back
end
