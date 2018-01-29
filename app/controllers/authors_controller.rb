class AuthorsController < BaseController
  # def index
  #   @autors = Author.find(params[:id])
  #   @autor_blogs = @autors.blogs.all
  # end

  def show
    @autor = Author.friendly.find(params[:id])
    @autor_blogs = @autor.blogs.all
  end
end
