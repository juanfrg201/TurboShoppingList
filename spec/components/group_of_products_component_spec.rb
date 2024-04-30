# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GroupOfProductsComponent, type: :component do
  before(:each) do
    @store_section = StoreSection.create!(name: 'Meat')
    @products = [
      { date: Date.today, products: [
        { name: 'Product 1', purchase_date: Date.today, store_section: @store_section, purchased: false, quantity: 5 },
        { name: 'Product 2', purchase_date: Date.yesterday, store_section: @store_section, purchased: false,
          quantity: 5 }
      ] }
    ]
    @products = Product.where(purchased: false).order(purchase_date: :asc).group_by(&:purchase_date)
  end
  it 'renders the list of products with the correct date' do
    @products.each do |date, products| 
      render_inline(GroupOfProductsComponent.new(products: @products, date: date))
      expect(page).to have_css('h3', text: date.strftime('%Y-%m-%d'))
      expect(page).to have_css('.product-name', text: 'Product 1')
      expect(page).to have_css('.product-name', text: 'Product 2')
    end 
  end
end
