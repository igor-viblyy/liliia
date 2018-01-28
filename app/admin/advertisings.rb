ActiveAdmin.register Advertising do
  menu label: 'Реклама'

  permit_params [:title, :position_top, :position_right,
                 :top_big, :page_event, :page_blog,
                 :page_article, :image_file_name, :image_file_size, :image_updated_at, :image_content_type, :image, :url
                ]

  index do
    id_column
    column :title
    column 'image' do |ad|
      image_tag(ad.image.url(:thumb))
    end
    column :image_updated_at
    column :position_top
    column :top_big
    column :position_right
    column :page_article
    column :page_blog
    column :page_event
    column :url
    actions
  end

  show do |ad|
    attributes_table do
      row :title
      row :image do
        image_tag(ad.image.url(:thumb)) if ad.image.present?
      end
      row :image_file_name
      row :image_updated_at
      row :position_top
      row :top_big
      row :position_right
      row :page_article
      row :page_blog
      row :page_event
      row :url
    end
  end

  form do |f|
    f.inputs 'advert' do
      f.input :title
      f.input :image, as: :file
      f.input :url
      f.input :position_top, as: :boolean
      f.input :position_right, as: :boolean
      f.input :top_big, as: :boolean
      f.input :page_event, as: :boolean
      f.input :page_article, as: :boolean
      f.input :page_blog, as: :boolean
    end
    f.actions
  end
end
