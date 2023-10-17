class AddBrandNameToBrands < ActiveRecord::Migration[7.0]
  def change
    add_column :brands, :BrandName, :string
  end
end
