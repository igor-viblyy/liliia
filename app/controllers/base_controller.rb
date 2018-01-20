class BaseController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @articles = Article.top_article(Time.now)
    @interesting = Article.interesting

    @events = Event.all

    @blogs = Blog.all

    @adverts_right = Advertising.right
    @adverts_top = Advertising.top
  end
end
