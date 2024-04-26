# frozen_string_literal: true

class GroupOfProductsComponent < ViewComponent::Base
  include Turbo::FramesHelper
  def initialize(products:)
    @products = products
  end
end
