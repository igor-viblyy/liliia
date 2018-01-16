class AboutsController < ApplicationController
  def show
    @abouts = About.all
  end
end
