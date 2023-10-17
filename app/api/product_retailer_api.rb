class ProductRetailerApi < Grape::API
  format :json
  resource :product_retailer_relations do
    desc 'Retrieve ProductRetailer data for a Retailer'
    params do
      requires :retailer_id, type: Integer, desc: 'Retailer ID'
    end
    get do
      puts 'agya'
      product_retailer_relations = ProductRetailerRelation.where(retailer_id: params[:retailer_id])
      if product_retailer_relations.any?
        products = []

        product_retailer_relations.each do |product_retailer_relation|
          product_master_id = product_retailer_relation.product_master_id
          product_master = ProductMaster.find_by(id: product_master_id)

          if product_master
            product_name = product_master.ProductName
            price = product_retailer_relation.price
            quantity = product_retailer_relation.quantity
            availability = product_retailer_relation.availability

            product_info = {
              ProductName: product_name,
              Price: price,
              Quantity: quantity,
              Availability: availability
            }

            products << product_info
          end
        end

        products
      else
        error!({ error: 'No ProductRetailerRelation records found for the retailer_id' }, 404)
      end
    end
  end
end
