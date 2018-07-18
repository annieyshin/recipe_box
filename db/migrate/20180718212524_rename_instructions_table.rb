class RenameInstructionsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :instructions, :step

    rename_table :instructions, :recipe_ingredients

    add_column :recipe_ingredients, :unit, :string    
  end
end
