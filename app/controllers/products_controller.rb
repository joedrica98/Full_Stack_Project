class ProductsController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product was successfully created"
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product updated successfully"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def index
    @products = Product.paginate(page: params[:page], per_page: 5)
  end

  def show
    @product = Product.find(params[:id])
    @stores = @product.stores.paginate(page: params[:page], per_page: 5)
  end

  private

  def product_params
    params.require(:product).permit(:name, :color, :size, :process, :category_id)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to product_path
    end
  end
end