ActiveAdmin.register Video do
  permit_params [:link]

  form do |f|
    f.inputs do
      f.input :link
    end
    f.actions
  end
end
