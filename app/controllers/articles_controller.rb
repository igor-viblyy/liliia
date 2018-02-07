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
                    url:  article_url(@article),
                    type: 'website',
                    title: @article.title,
                    description: @article.body.html_safe,
                    image: URI.join(request.url, @article.image.url),
                  }
  end

  private
    def set_article
      @article = Article.friendly.find(params[:id])
    end
end
