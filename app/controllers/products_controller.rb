class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy]

  def index
    @products = Product.order('created_at DESC')
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "Product was successfully created"
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Product was successfully updated"
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = "Product was successfully deleted"
      redirect_to products_path
    else
      render :show
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :overview, :price, :description, :photo)
    end

    def set_product
      @product = Product.find(params[:id])
    end

end
