class QuickViewsController < ApplicationController

  def show
    @product = Product.find(params[:product_id])
  end
end
