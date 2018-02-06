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
                    locale: 'uk_UK',
                    type: 'article',
                    site_name: 'Лілія',
                    image: @article.image.path(:medium),
                    title: @article.title,
                    url:  article_url(@article),
                    description: @article.body.html_safe
                  }
  end

  private
    def set_article
      @article = Article.friendly.find(params[:id])
    end
end
