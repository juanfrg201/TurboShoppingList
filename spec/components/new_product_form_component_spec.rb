# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewProductFormComponent, type: :component do
  before(:each) do
    @store_section = StoreSection.create!(name: 'Meat')
  end
  it 'renders the new product form correctly' do
    render_inline(NewProductFormComponent.new(product: Product.new))

    expect(page).to have_css('form')

    expect(page).to have_css('input[type="text"]', count: 2)
    expect(page).to have_css('input[type="date"]')
    expect(page).to have_css('select')
    expect(page).to have_css('input[type="checkbox"]')
    expect(page).to have_css('input[type="number"]') 

  end
end

