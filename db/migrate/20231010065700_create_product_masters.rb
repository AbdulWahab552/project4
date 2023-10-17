class CreateProductMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :product_masters do |t|
      t.string :ProductName
      t.text :Description
      t.references :Category, null: false, foreign_key: true
      t.references :Brand, null: false, foreign_key: true
      t.timestamps
    end
  end
end
