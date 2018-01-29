class CategoriesController < BaseController
  def show
    @categories = Category.friendly.find(params[:id])
    @category = @categories.articles.friendly.all

    @adverts = Advertising.page_article
  end
end
