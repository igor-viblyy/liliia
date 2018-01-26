class BaseController < ApplicationController
  def index
    @articles = Article.top_article(Time.now)
    @interesting = Article.interesting

    @events = Event.index_event

    @blogs = Blog.all

    @adverts_right = Advertising.right
    @adverts_top = Advertising.top
    @adverts_big = Advertising.big

    @videos = Video.top(Time.now)
  end
end
