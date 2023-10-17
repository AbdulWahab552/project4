class BrandsApi< Grape::API
  format :json
  resource :brands do
    desc 'Get a list of retailers'
    get do
      Brand.all
    end
  end
end
