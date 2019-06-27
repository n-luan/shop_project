class Manager::CategoryController < Manager::BaseController

  def index
    @categories = Category.order("created_at desc")
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      @categories = Category.order("created_at desc").page(params[:page]).per(10)
    else
      render :"new_invalid"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes category_params
      @categories = Category.order("updated_at desc").page(params[:page]).per(10)
    else
      render :"edit_invalid"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    @categories = Category.order("updated_at desc").page(params[:page]).per(10)
  end

  private

  def category_params
    params.require(:category).permit :name
  end

end
