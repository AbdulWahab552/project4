ActiveAdmin.register ProductMaster do
  permit_params :ProductName, :Description, :Category_id, :Brand_id
end
