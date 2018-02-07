class BlogsController < BaseController
  before_action :set_blog, only: [:show]
  def index
    @blogs = Blog.all.page(params[:page])
    @adverts = Advertising.page_blog
  end

  def show
    set_meta_tags title: @blog.title,
                  site: 'Лілія',
                  description: @blog.body.html_safe,
                  og: {
                    title: @blog.title,
                    description: @blog.body.html_safe,
                    type: 'website',
                    url:  blog_url(@blog),
                    image: URI.join(request.url, @blog.image.url(:medium)),
                    image: {
                      width: "300",
                      height: "300"
                    }
                  }
  end

  private
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end
end
