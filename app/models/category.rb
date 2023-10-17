class Category < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["CategoryName", "created_at", "id", "updated_at"]
  end
end
