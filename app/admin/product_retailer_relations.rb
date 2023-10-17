ActiveAdmin.register ProductRetailerRelation do
  permit_params :availability, :price, :quantity, :retailer_id, :product_master_id
end
