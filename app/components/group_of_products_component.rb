# frozen_string_literal: true

class GroupOfProductsComponent < ViewComponent::Base
  include Turbo::FramesHelper
  def initialize(products:, date:)
    @products = products
    @date = date.to_date
    @container_id = "products_#{@date}"
  end
end
