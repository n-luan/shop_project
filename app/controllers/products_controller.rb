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
  end

end
