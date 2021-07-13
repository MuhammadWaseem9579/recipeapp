class ChangeNameInIngriditans < ActiveRecord::Migration[6.1]
  def change
    change_column :ingridiants, :name, :string
  end
end
