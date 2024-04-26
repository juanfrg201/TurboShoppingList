require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it "renders the index template" do
      get products_path
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves a new product" do
        product_params = { name: "producto", purchase_date: Date.today, store_name: "Store", store_section_id: 1, purchased: false, quantity: 3 }
        post products_path, params: { product: product_params }
        expect(response).to redirect_to(products_url)
      end  
    end

    context "with invalid attributes" do
      it "does not save a new product" do
        product_params = { name: "" }
        post products_path, params: { product: product_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /products/:id/mark_as_purchased" do
    context "with valid product ID and purchase update" do
      it "marks the product as purchased and renders the mark_as_purchased template in turbo_stream format" do
        @store_section = StoreSection.create!(name: "Meat")
        @product = Product.create!(
          name: "Chicken",
          purchase_date: Date.today,
          store_name: "Grocery Store",
          store_section: @store_section,
          purchased: false,
          quantity: 5
        )
        put mark_as_purchased_product_path(@product.id)
        expect(response).to redirect_to(products_url)
        expect(assigns(:product).purchased?).to be(true)
      end
    end

    context "with invalid product ID" do
      it "returns a 404 Not Found" do
        put mark_as_purchased_product_path(12345)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end

