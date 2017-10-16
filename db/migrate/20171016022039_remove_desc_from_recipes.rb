class RemoveDescFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :descritpion, :text
    add_column :recipes, :description, :text
  end
end
