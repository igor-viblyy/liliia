class ArticlesController < BaseController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.all
    @adverts_right = Advertising.right
  end

  def show
    set_meta_tags title: @article.title,
                  site: 'Лілія',
                  description: @article.body.html_safe,
                  og: {
                    title: @article.title,
                    description: @article.body.html_safe,
                    type: 'website',
                    url:  article_url(@article),
                    image: URI.join(request.url, @article.image.url(:medium)),
                    image: {
                      type: 'image/jpg',
                      width: "300",
                      height: "300"
                    }
                  }
  end

  private
    def set_article
      @article = Article.friendly.find(params[:id])
    end
end
