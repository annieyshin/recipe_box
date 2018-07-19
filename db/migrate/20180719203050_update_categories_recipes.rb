class UpdateCategoriesRecipes < ActiveRecord::Migration[5.2]
  def change
    rename_table :categories_recipes, :category_recipes

    rename_column :category_recipes, :categories_id, :category_id
    rename_column :category_recipes, :recipes_id, :recipe_id

  end
end
