class ProductsController < ApplicationController

  def index
    @q = Product.ransack(params[:q])
    @results = @q.result(distinct: true).page(params[:page]).per(10)
    unless @results.present?
      flash.now[:info] = "Không tìm thấy sản phẩm!"
    end
  end

  def show
    @product = Product.find params[:id]
    @related_products = Product.best_product.limit(5)
    @reviews = @product.reviews.page(params[:page]).per(10)
    @avg_rate = @product.reviews.average(:rate)&.round(2) || 0
  end

end
