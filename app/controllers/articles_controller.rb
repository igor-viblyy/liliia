class ArticlesController < BaseController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.all
    @adverts_right = Advertising.right
  end

  def show;end

  private
    def set_article
      @article = Article.friendly.find(params[:id])
    end
end
