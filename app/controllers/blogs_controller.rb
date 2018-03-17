class BlogsController < BaseController
  before_action :set_blog, only: [:show]
  def index
    @blogs = Blog.all_blogs.page(params[:page])
    @adverts = Advertising.page_blog
  end

  def show
    set_meta_tags title: @blog.title,
                  site: 'Лілія',
                  description: @blog.body.html_safe,
                  og: {
                    url:  blog_url(@blog),
                    type: 'website',
                    title: @blog.title,
                    description: @blog.body.html_safe,
                    image: URI.join(request.url, @blog.image.url)
                  }
  end

  private
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end
end
