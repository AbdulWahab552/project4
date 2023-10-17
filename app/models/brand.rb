class Brand < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["BrandName", "created_at", "id", "updated_at"]
  end
end
