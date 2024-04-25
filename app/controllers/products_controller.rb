class ProductsController < ApplicationController
  def index
    @products = Product.order(purchase_date: :asc).group_by(&:purchase_date)
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render turbo_stream: turbo_stream.append("products", partial: "product", locals: { product: @product })
    else
      # Handle validation errors
    end
  end

  def mark_as_purchased
    @product = Product.find(params[:id])
    @product.update(purchased: true)
    render turbo_stream: turbo_stream.remove("product_#{params[:id]}")
  end

  private

  def product_params
    params.require(:product).permit(:name, :purchase_date, :store_name, :store_section_id, :purchased, :quantity)
  end
end
