class RetailersAPI < Grape::API
  format :json

  resource :retailers do
    desc 'Get a list of retailers'
    get do
      retailers = Retailer.all
      present retailers, with: RetailerEntity
    end
  end
end
