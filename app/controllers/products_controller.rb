class ProductsController < ApplicationController
  before_action :set_products, only: [:index, :create]

  # GET /products
  def index
    # Initializes a new Product object for the creation form in the view
    @product = Product.new
  end

  # POST /products
  # POST /products.json
  # Handles the creation of a new product.
  def create
    # Creates a new product object with the parameters from the form.
    @product = Product.new(product_params)

    # Responds to different formats (HTML, Turbo Stream, etc.) based on the request format.
    respond_to do |format|
      # If the product is successfully saved to the database:
      if @product.save
        # Responds with an HTML format, redirects to the products URL, and sets a notice flash message.
        format.html { redirect_to products_url, notice: 'Product was successfully created.' }
        # Responds with a Turbo Stream format, renders the :create template, and passes a local variable 'products'.
        format.turbo_stream { render :create, locals: { products: set_products } }
      else
        # If saving the product fails, responds with an HTML format, renders the :index template, and sets an error flash message.
        format.html { render :index, error: 'Producto no se pudo crear', status: :unprocessable_entity }
        # Responds with a Turbo Stream format, renders the :create template, and passes a local variable 'products'.
        format.turbo_stream { render :create, locals: { products: set_products } }
      end
    end
  end

  # Marks a product as purchased and responds to the Turbo Stream or HTML request.
  # GET /products/:id/mark_as_purchased
  def mark_as_purchased
    # Find the product by its ID in the database
    @product = Product.find(params[:id])

    respond_to do |format|
      # Try to update the product by marking it as purchased
      if @product.update(purchased: true)
        # Respond to the Turbo Stream request with the mark_as_purchased.turbo_stream.erb template
        format.turbo_stream { render :mark_as_purchased, locals: { product: @product } }
        # If the update was successful, redirect the user to the products page with a success message
        format.html { redirect_to products_url, notice: 'Product was successfully marked as purchased.' }
      else
        # If there are errors updating the product, render the index view to display them
        format.html { render :index }
      end
    end
  end

  private

  # Sets the instance variable @products with a sorted and grouped list of products.
  #
  # This method fetches all products that have not been purchased, orders them by purchase_date in ascending order,
  # and then groups them by purchase_date. The resulting hash is stored in the @products instance variable.
  #
  # Example usage:
  #   set_products
  #
  def set_products
    @products = Product.where(purchased: false).order(purchase_date: :asc).group_by(&:purchase_date)
  end

  # Defines the parameters accepted for creating or updating a product.
  #
  # This method specifies the parameters that are allowed to be used for creating or updating a product.
  # It uses strong parameters to permit specific attributes for mass assignment.
  #
  # Example usage:
  #   params.require(:product).permit(:name, :purchase_date, :store_name, :store_section_id, :purchased, :quantity)
  #
  def product_params
    params.require(:product).permit(:name, :purchase_date, :store_name, :store_section_id, :purchased, :quantity)
  end
end