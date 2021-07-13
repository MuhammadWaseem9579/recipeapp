class CreateIngridiants < ActiveRecord::Migration[6.1]
  def change
    create_table :ingridiants do |t|
      t.integer :name
      t.timestamps
    end
  end
end
