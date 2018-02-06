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
                    title: @event.title,
                    description: @event.body.html_safe,
                    type: 'website',
                    url:  event_url(@event),
                    image: image_url(@event.image.url(:medium))
                  }
  end

  private
    def set_event
      @event = Event.friendly.find(params[:id])
    end
end
