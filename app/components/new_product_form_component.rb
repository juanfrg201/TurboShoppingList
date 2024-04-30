# frozen_string_literal: true

class NewProductFormComponent < ViewComponent::Base
  include Turbo::FramesHelper

  # Initialize a new instance of the NewProductFormComponent class.
  #
  # @param product [Object] The product object to be used in the form.
  #
  # @return [NewProductFormComponent] The initialized instance of NewProductFormComponent.
  #
  # @example
  #   form = NewProductFormComponent.new(product: @product)
  #
  # This method initializes a new instance of the NewProductFormComponent class.
  # It sets the @product instance variable to the provided product object,
  # which can then be used in the form to display or manipulate product data.
  def initialize(product:)
    @product = product
  end

end