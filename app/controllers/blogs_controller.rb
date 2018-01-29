class BlogsController < BaseController
  def index
    @blogs = Blog.all
    super
  end

  def show
    @blog = Blog.friendly.find(params[:id])
  end
end
