class CreateRecipeIngridiants < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_ingridiants do |t|
      t.integer :recipe_id
      t.integer :ingridiant_id
      t.timestamps
    end
  end
end
