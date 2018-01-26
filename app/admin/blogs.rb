ActiveAdmin.register Blog do
  permit_params [:title, :body, :image, :author_id]

  index do
    id_column
    column :author
    column :title
    column :image do |img|
      image_tag(img.image.url(:thumb)) if img.image.present?
    end
    column 'body' do |b|
      truncate_html(b.body)
    end
    actions
  end

  show do |bl|
    attributes_table do
      row :author
      row :title
      row :image do
        image_tag(bl.image.url(:thumb)) if bl.image.present?
      end
      row :body do
        bl.body.html_safe
      end
    end
  end

  form do |f|
    f.inputs 'blog' do
      f.input :author
      f.input :title
      f.input :body
      f.input :image, as: :file, hint: image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end
end
