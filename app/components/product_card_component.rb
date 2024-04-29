# frozen_string_literal: true

class ProductCardComponent < ViewComponent::Base
  include Turbo::FramesHelper
  def initialize(product:)
    @product = product
  end
end
