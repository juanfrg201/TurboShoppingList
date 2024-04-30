require 'rails_helper'

RSpec.describe 'products/index.html.erb', type: :view do
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

  it 'renders product details correctly' do
    render
    @products.each do |_date, products|
      products.each do |product|
        expect(rendered).to have_content(product.name)
        expect(rendered).to have_selector("#products_#{product.purchase_date.strftime('%Y-%m-%d')}")
      end
    end
  end

  it 'modal is hidden initially' do
    render
    expect(rendered).to have_css('#myModal', visible: false) # Verifica que el modal está oculto inicialmente
  end

  it "renders the 'create button'" do
    render
    expect(rendered).to have_selector('button', text: 'Crear producto')
  end

  it "renders the 'Productos' title" do
    render
    expect(rendered).to have_selector('h2.title', text: 'Productos')
  end
end
