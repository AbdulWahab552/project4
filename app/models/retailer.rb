class Retailer < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["ContactInfo", "Location", "RetailerName", "created_at", "id", "updated_at"]
  end
end
