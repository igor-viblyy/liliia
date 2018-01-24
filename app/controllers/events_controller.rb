class EventsController < BaseController
  def index
    @events = Event.all
    super
  end

  def show
    @event = Event.find(params[:id])
  end
end
