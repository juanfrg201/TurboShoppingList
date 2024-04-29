class ProductsController < ApplicationController
  before_action :set_products

  def index
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        @products = Product.where(purchased: false).order(purchase_date: :asc).group_by(&:purchase_date)
        format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
        format.turbo_stream { render :create, locals: { products: @products } }
      else
        format.html { render :index, error: 'Producto no se pudo crear', status: :unprocessable_entity }
        format.turbo_stream { render :create, locals: { products: @products } }
      end
    end
  end

  def mark_as_purchased
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(purchased: true)
        format.turbo_stream { render :mark_as_purchased, locals: { product: @product } }
        format.html { redirect_to products_url, notice: 'Product was successfully marked as purchased.' }
      else
        format.html { render :index }
      end
    end
  end

  private

  def set_products
    @products = Product.where(purchased: false).order(purchase_date: :asc).group_by(&:purchase_date)
  end

  def product_params
    params.require(:product).permit(:name, :purchase_date, :store_name, :store_section_id, :purchased, :quantity)
  end
end
