require 'spec_helper'

describe(RecipeIngredient) do
  it { should belong_to(:recipe)}
  it { should belong_to(:ingredient)}
  it "deletes a recipe and its associated ingredients" do
    recipe = Recipe.create({:name => "burritos"})
    ingredient = Ingredient.create({:name => 'Guac'})
    recipe.recipe_ingredients.create({:ingredient => ingredient, :amount => 1, :unit => "dollops"})
    recipe2 = Recipe.create({:name => "Tacos"})
    ingredient2 = Ingredient.create({:name => 'Salsa'})
    recipe2.recipe_ingredients.create({:ingredient => ingredient2, :amount => 1, :unit => "cup"})
    recipe_ingredients = RecipeIngredient.where(recipe_id: recipe.id)
    recipe_ingredients.destroy(recipe_ingredients.ids)
    recipe.destroy
    expect(RecipeIngredient.all).to(eq(recipe2.recipe_ingredients))
    expect(Recipe.all).to(eq([recipe2]))
  end
end
