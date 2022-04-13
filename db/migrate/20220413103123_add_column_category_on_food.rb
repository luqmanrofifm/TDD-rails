class AddColumnCategoryOnFood < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :category_id, :string
  end
end
