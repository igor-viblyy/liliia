class CategoriesController < BaseController
  def show
    @categories = Category.friendly.find(params[:id])
    @category = @categories.articles.all.page(params[:page])

    @adverts = Advertising.page_article
  end
end
