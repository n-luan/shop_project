class StaticPagesController < ApplicationController

  def home
    @products = Product.products.page(params[:page]).per(10)
    @best_products = Product.best_product.limit(4)
  end
end
