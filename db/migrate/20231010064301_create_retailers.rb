class CreateRetailers < ActiveRecord::Migration[7.0]
  def change
    create_table :retailers do |t|
      t.string :RetailerName
      t.string :Location
      t.text :ContactInfo
      t.timestamps
    end
  end
end
