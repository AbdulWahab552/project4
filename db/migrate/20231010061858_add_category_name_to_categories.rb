class AddCategoryNameToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :CategoryName, :string
  end
end
