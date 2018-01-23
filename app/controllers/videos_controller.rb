class VideosController < BaseController
  def index
    @videos = Video.all
  end
end
