class CategoriesController < BaseController
  # def index
  #   @categories = Category.all
  #   @articles = @rticle.categories.all
  # end

  def show
    @category = Category.find(params[:id])
    @category = @category.articles.all

    @adverts_right = Advertising.right
  end
end
