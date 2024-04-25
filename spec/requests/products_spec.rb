require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    before do
      StoreSection.create(name: "Meat")
      @product = Product.create(name: "Product1", purchase_date: Date.today, store_section_id: StoreSection.last.id, purchased: false, quantity: 2)
    end

    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns a new product" do
      get :index
      expect(assigns(:product)).to be_a_new(Product)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) do
        { product: { name: "New Product", purchase_date: Date.today, store_section_id: 1, purchased: false, quantity: 1 } }
      end

      it "creates a new product" do
        expect {
          post :create, params: valid_params
        }.to change(Product, :count).by(1)
      end

      it "renders turbo_stream to append new product" do
        post :create, params: valid_params
        expect(response.body).to include('turbo-stream')
        expect(response.body).to include('append')
        expect(response.body).to include('products')
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        { product: { name: "", purchase_date: Date.today, store_section_id: 1, purchased: false, quantity: 1 } }
      end

      it "does not create a new product" do
        expect {
          post :create, params: invalid_params
        }.not_to change(Product, :count)
      end

      it "renders an error message" do
        post :create, params: invalid_params
        expect(response).to render_template("create")
        expect(response.body).to include("error")
      end
    end
  end
end
