class CategoriesController < ApplicationController
  # def index
  #   @categories = Category.all
  #   @articles = @rticle.categories.all
  # end

  def show
    @category = Category.find(params[:id])
    @category = @category.articles.all
  end
end
