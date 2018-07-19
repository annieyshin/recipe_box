class UpdateCategoryRecipes < ActiveRecord::Migration[5.2]
  def change
    rename_table :category_recipes, :categories_recipes
  end
end
