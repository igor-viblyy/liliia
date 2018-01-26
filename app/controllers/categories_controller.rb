class CategoriesController < BaseController
  def show
    @category = Category.find(params[:id])
    @category = @category.articles.all

    @adverts = Advertising.page_article
  end
end
