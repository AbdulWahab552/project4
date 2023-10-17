class ProductRetailerRelation < ApplicationRecord
  belongs_to :product_master
  belongs_to :retailer
  def self.ransackable_attributes(auth_object = nil)
    ["availability", "created_at", "id", "price", "product_master_id", "quantity", "retailer_id", "updated_at"]
  end
end
