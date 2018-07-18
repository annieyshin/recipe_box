class UpdateRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :instructions, :string
  end
end
