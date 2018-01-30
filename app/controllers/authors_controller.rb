class AuthorsController < BaseController
  def show
    @autors = Author.friendly.find(params[:id])
    @autor_blogs = @autors.blogs.all.page(params[:page])

    @adverts = Advertising.page_blog
  end
end
