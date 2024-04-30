# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductCardComponent, type: :component do
  before(:each) do
    @store_section = StoreSection.create!(name: 'Meat')
    @product = Product.create!(
      name: 'Chicken',
      purchase_date: Date.today,
      store_name: 'Grocery Store',
      store_section: @store_section,
      purchased: false,
      quantity: 5
    )
    
  end

  it 'renders the product name' do
    render_inline(described_class.new(product:  @product ))

    expect(page).to have_selector('h2', text:  @product .name)
  end

  it 'renders the purchase date in the correct format' do
    render_inline(described_class.new(product:  @product ))

    expect(page).to have_selector('p', text: I18n.l( @product .purchase_date, format: :default))
  end

  context 'when the product is not purchased' do
    before { @product.update(purchased: false) }

    it 'renders the "Comprar producto" button' do
      render_inline(described_class.new(product:  @product ))

      expect(page).to have_selector('.button.is-info.mark-as-purchased-btn', text: 'Comprar producto')
    end
  end

  context 'when the product is purchased' do
    before { @product.update(purchased: true) }

    it 'does not render the "Comprar producto" button' do
      render_inline(described_class.new(product:  @product ))

      expect(page).not_to have_selector('.button.is-info.mark-as-purchased-btn', text: 'Comprar producto')
    end
  end
end
