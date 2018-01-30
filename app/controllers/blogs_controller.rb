class BlogsController < BaseController
  def index
    @blogs = Blog.all.page(params[:page])
    @adverts = Advertising.page_blog
  end

  def show
    @blog = Blog.friendly.find(params[:id])
  end
end
