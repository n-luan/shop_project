class CategoriesController < ApplicationController

  def show
    @category = Category.find params[:id]
    @products = @category.products.page(params[:page]).per(20)
  end
end
