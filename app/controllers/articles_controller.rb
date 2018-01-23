class ArticlesController < BaseController
  def index
    @articles = Article.all
    @adverts_right = Advertising.right
  end

  def show
    @article = Article.find(params[:id])
  end
end
