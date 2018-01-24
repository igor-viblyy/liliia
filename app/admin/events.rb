ActiveAdmin.register Event do
  menu label: 'Події'
  permit_params [:title, :body, :published, :date]
end
