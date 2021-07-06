class StoresController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show

  end

  def index
    @stores = Store.paginate(page: params[:page], per_page: 5)
  end

  def new
    @store = Store.new
  end

  def edit

  end

  def create
    @store = Store.new(stores_params)
    @store.user = current_user
    if @store.save
      flash[:notice] = "Store was created successfully."
      redirect_to @store
    else
      render 'new'
    end
  end

  def update
    if @store.update(stores_params)
      flash[:notice] = "Store was updated successfully."
      redirect_to @store
    else
      render 'edit'
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_path
  end

  private

  def set_category
    @store = Store.find(params[:id])
  end

  def stores_params
    params.require(:store).permit(:name, :street, :number, :zip_code, :city, :country, product_ids: [])
  end

  def require_same_user
    if current_user != @store.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own category"
      redirect_to @store
    end
  end

end
