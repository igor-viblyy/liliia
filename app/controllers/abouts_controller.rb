class AboutsController < BaseController
  def show
    @abouts = About.all
  end
end
