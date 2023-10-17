class  SampleApi< Grape::API
  format :json
  resource :retailers do
    desc 'Get a list of retailers'
    get do
      Retailer.all
    end
  end
end
