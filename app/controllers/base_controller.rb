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
                    title: 'Лілія',
                    description: 'Інтернет-журнал про здоровя та життя Лілія',
                    type: 'website',
                    url:  "http://liliia.com.ua",
                    image: URI.join(request.url, image_url('logo-black.png')),
                    image: {
                      type: 'image/png',
                      width: '600',
                      height: '315'
                    }
                  }
  end
end
