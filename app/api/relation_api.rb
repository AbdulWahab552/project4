class RelationApi< Grape::API
  format :json
  resource :product_retailers do
    desc 'Get a list of retailers'
    get do
      ProductRetailerRelation.all
    end
  end
end
