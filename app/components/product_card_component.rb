# frozen_string_literal: true

class ProductCardComponent < ViewComponent::Base
  include Turbo::FramesHelper
  
  # Initialize a new instance of the NewProductFormComponent class.
  #
  # @param product [Product] The product object to be associated with the component.
  #
  # @example
  #   component = NewProductFormComponent.new(product: @product)
  #
  # @return [NewProductFormComponent] A new instance of the NewProductFormComponent class.
  def initialize(product:)
    @product = product
  end

end
