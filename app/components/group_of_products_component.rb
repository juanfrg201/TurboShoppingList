# frozen_string_literal: true

class GroupOfProductsComponent < ViewComponent::Base
  include Turbo::FramesHelper
  
  # Initializes a new instance of the GroupOfProductsComponent class.
  #
  # @param products [Array] An array of products to be displayed in the component.
  # @param date [Date, String] The date used for organizing the products.
  # @return [GroupOfProductsComponent] A new instance of GroupOfProductsComponent.
  #
  # @example
  #   component = GroupOfProductsComponent.new(products: [@product], date: '2024-04-29')
  #
  def initialize(products:, date:)
    @products = products
    @date = date.to_date  # Converts the provided date to a Date object if it's a string.
    @container_id = "products_#{@date}"  # Unique ID to identify the HTML container in the view.
  end

end
