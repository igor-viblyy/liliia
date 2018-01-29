class EventsController < BaseController
  def index
    @events = Event.all
    @advertisings = Advertising.page_event
  end

  def show
    @event = Event.friendly.find(params[:id])
  end
end
