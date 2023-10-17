# app/api/entities/retailer_entity.rb
class RetailerEntity < Grape::Entity
  expose :RetailerName
  expose :Location
  expose :ContactInfo
  # Add more attributes as needed
end
