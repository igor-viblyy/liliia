ActiveAdmin.register Blog do
  permit_params [:title, :body, :category_id, :image]

  form do |f|
    f.inputs do
      f.input :category
      f.input :title
      f.input :body
      f.input :image, as: :file
    end
    f.actions
  end
end
