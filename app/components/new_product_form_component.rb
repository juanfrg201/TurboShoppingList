# frozen_string_literal: true
class NewProductFormComponent < ViewComponent::Base
  include Turbo::FramesHelper
  def initialize(product:)
    @product = product
  end
end
