class CategoryApi< Grape::API
  format :json
  resource :categories do
    desc 'Get a list of retailers'
    get do
      Category.all
    end
  end
end
