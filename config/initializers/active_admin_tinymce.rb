ActiveAdmin::Tinymce.setup do |config|

  # == Images
  #
  # Your model for images. Editor use this class for insert images into text
  #
  #config.model_class = Image
  config.model_class = Article
  config.model_class = Blog
  config.model_class = Image
  # == Attachment
  #
  # Name of the method for get paperclip's attached files
  #
  # Defaults:
  config.attachment_attr_name = 'image'

  # == Active Admin namespace
  #
  # Name of the admin's namespace
  #
  # Defaults:
  # config.admin_namespace = 'admin'


end
