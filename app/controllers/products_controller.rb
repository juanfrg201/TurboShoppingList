class ProductsController < ApplicationController
  def index
    @products = Product.where(purchased: false).order(purchase_date: :asc).group_by(&:purchase_date)
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save 
        format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
        format.turbo_stream { render :create, locals: {products: @product } }
      else
        format.turbo_stream { render :index, status: :ok, locals: {product: @product}}
      end
    end
  end

  def mark_as_purchased
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(purchased: true)
        format.turbo_stream { render :mark_as_purchased, locals: {product: @product} }
        format.html { redirect_to products_url, notice: 'Product was successfully marked as purchased.' }
      else
        format.html { render :index }
      end
    end
  end
  
  

  private

  def product_params
    params.require(:product).permit(:name, :purchase_date, :store_name, :store_section_id, :purchased, :quantity)
  end
end
