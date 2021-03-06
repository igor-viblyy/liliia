class EventsController < BaseController
  before_action :set_event, only: [:show]
  def index
    @events = Event.all.page(params[:page])
    @adverts = Advertising.page_event
  end

  def show
    set_meta_tags title: @event.title,
                  site: 'Лілія',
                  description: @event.body.html_safe,
                  og: {
                    url:  event_url(@event),
                    type: 'website',
                    title: @event.title,
                    description: @event.body.html_safe,
                    image: URI.join(request.url, @event.image.url)
                  }
  end

  private
    def set_event
      @event = Event.friendly.find(params[:id])
    end
end
