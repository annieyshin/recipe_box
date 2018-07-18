class UpdateRecipesInstruction < ActiveRecord::Migration[5.2]
  def change
    change_table :recipes do |t|
      t.rename :instructions, :instruction
    end
  end
end
