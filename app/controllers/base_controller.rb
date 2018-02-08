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

    set_meta_tags title: 'Лілія',
                  site: 'Лілія',
                  description: 'Інтернет-журнал про здоровя та життя Лілія',
                  og: {
                    url:  "http://liliia.com.ua",
                    type: 'website',
                    title: 'Лілія',
                    description: 'Інтернет-журнал про здоровя та життя Лілія',
                    image: URI.join(request.url, image_url('logo.png'))
                  }
  end
end
