class Manager::ProductsController < Manager::BaseController
  before_action :load_product, only: [:edit, :update, :destroy]
  before_action :product_categories

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @product = Product.new product_params
    if @product.save
      @products = Product.all
      respond_to do |format|
        format.js
      end
    else
      render "new_form"
    end
  end

  def edit; end

  def update
    @product.update product_params
    @products = Product.all
    respond_to do |format|
      format.js
    end

  end

  def destroy
    @product.destroy
    @products = Product.all
    respond_to do |format|
      format.js
    end
  end


  private

  def product_params
    params.require(:product).permit :name, :price, :image, :description, :category_ids, :sale_price
  end

  def load_product
    @product = Product.find params[:id]
  end

  def product_categories
    @product_categories = Category.pluck :name, :id
  end
end
