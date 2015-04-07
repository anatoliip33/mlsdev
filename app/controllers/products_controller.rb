class ProductsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :destroy]

  def index
    @products = Product.all
    @product = Product.new
  end

  def show
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def new
    @product = Product.new
    respond_to do |format|
      format.html
      format.js { render 'edit', layout: false }
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private

    def set_ticket
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description)
    end

end
