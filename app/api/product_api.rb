class ProductApi< Grape::API
  format :json
  resource :product_masters do
    desc 'Get a list of retailers'
    get do
      ProductMaster.all
    end
  end
end
