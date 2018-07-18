class CreateRecipesIngredientsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
    end

    create_table(:instructions) do |t|
      t.column(:recipe_id, :integer)
      t.column(:ingredient_id, :integer)
      t.column(:amount, :integer)
      t.column(:step, :integer)
    end

    create_table(:categories) do |t|
      t.column(:name, :string)
    end

    create_table(:categories_recipes) do |t|
      t.column(:categories_id, :integer)
      t.column(:recipes_id, :integer)
    end

    create_table(:ingredients) do |t|
      t.column(:name, :string)
    end
  end
end
