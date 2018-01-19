class BaseController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @articles = Article.top_article(Time.now)
    @events = Event.all
    @blogs = Blog.all
    @adverts_right = Advertising.right
    # @categories = Category.all
    # @category = @categories.article.all
  end
end
