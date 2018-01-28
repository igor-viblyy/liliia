class BaseController < ApplicationController
  def index
    @articles = Article.top_article
    @interesting = Article.interesting

    @events = Event.index_event

    @blogs = Blog.top_blog(Time.zone.now)

    @adverts_right = Advertising.right
    @adverts_top = Advertising.top
    @adverts_big = Advertising.big

    @videos = Video.top(Time.zone.now)
  end
end
