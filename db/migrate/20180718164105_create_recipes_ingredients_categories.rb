class CreateRecipesIngredientsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:instructions, :string)
      t.column(:ingredients_recipes_id, :integer)
      t.column(:category_id, :integer)
    end

    create_table(:categories) do |t|
      t.column(:name, :string)
    end

    create_table(:ingredients) do |t|
      t.column(:name, :string)
    end

    create_table(:ingredients_recipes) do |t|
      t.column(:recipes_id, :integer)
      t.column(:ingredients_id, :integer)
      t.column(:amount, :integer)
      t.column(:unit, :string)
    end
  end
end
