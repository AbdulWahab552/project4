class CreateProductRetailerRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :product_retailer_relations do |t|
      t.decimal :price
      t.integer :quantity
      t.boolean :availability
      t.references :product_master, null: false, foreign_key: true
      t.references :retailer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
