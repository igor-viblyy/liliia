ActiveAdmin.register Article do
  menu label: 'Статті'

  permit_params [:title, :body, :image_file_name, :image_file_size, :image_updated_at, :image_content_type, :image, :url, :category_id]

  index do
    id_column
    column :category
    column :title
    column 'body' do |article|
      truncate_html(article.body, length: 120)
    end
    column :created_at
    column 'image' do |article|
      image_tag(article.image.url(:thumb))
    end
    actions
  end

  show do |article|
    attributes_table do
      row :category
      row :title

      row :body do
        truncate_html(article.body, length: 320)
      end

      row :image do
        image_tag(article.image.url(:thumb)) if article.image.present?
      end

      row :created_at

    end
  end

  form do |f|
    f.inputs 'Article' do
      f.input :category
      f.input :title
      f.input :body
      f.input :image, require: true, as: :file
    end
    f.actions
  end
end
