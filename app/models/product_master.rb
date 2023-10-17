class ProductMaster < ApplicationRecord
  belongs_to :Category
  belongs_to :Brand

  def self.ransackable_attributes(auth_object = nil)
    ["Brand_id", "Category_id", "Description", "ProductName", "created_at", "id", "updated_at"]
  end
end
