class ProductRetailerEntity < Grape::Entity
      expose :id
      expose :price
      expose :quantity
      expose :availability
      expose :retailer_id
      expose :product_master_id
    end
