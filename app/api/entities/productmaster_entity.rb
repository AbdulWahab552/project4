class ProductMasterEntity < Grape::Entity
  expose :id
  expose :ProductName
  expose :Description
  expose :Category, using: MyAPI::Entities::Category
  expose :Brand, using: MyAPI::Entities::Brand
end
