ActiveAdmin.register Event do
  menu label: 'Події'
  permit_params [:title, :body, :published, :date, :company_id, :image]

  index do
    id_column
    column :company
    column :title
    column 'image' do |img|
      image_tag(img.image.url(:thumb)) if img.image.present?
    end
    column 'body' do |ev_body|
      truncate_html(ev_body.body, length: 50)
    end
    column :date
    actions
  end

  show do |ev|
    attributes_table do
      row :company
      row :title
      row :image do
        image_tag(ev.image.url(:thumb)) if ev.image.present?
      end
      row :body do
        ev.body.html_safe
      end
    end
  end

  form do |f|
    f.inputs 'event' do
      f.input :company
      f.input :title
      f.input :image, as: :file, hint: image_tag(f.object.image.url(:thumb))
      f.input :date
      f.input :body
      f.input :published
    end
    f.actions
  end
end
