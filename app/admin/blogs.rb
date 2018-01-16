ActiveAdmin.register Blog do
  permit_params [:title, :body, :category_id]
end
