ActiveAdmin.register Image do
  permit_params [:image_file_name, :image_file_size, :image_updated_at, :image_content_type, :image]

  form do |f|
    f.inputs 'image' do
      f.input :image, as: :file
    end
    f.actions
  end
end
