# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  name             :string
#  purchase_date    :date
#  store_name       :string
#  store_section_id :integer          not null
#  purchased        :boolean
#  quantity         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# spec/models/product_spec.rb
require 'rails_helper'

RSpec.describe Product, type: :model do
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

  describe 'validations' do
    it 'should return an error for invalid name format' do
      @product.name = 'Invalid@Name'
      expect(@product).not_to be_valid
    end

    it 'should return an error for empty purchase date' do
      @product.purchase_date = nil
      expect(@product).not_to be_valid
    end

    it 'should return an error for invalid store name length' do
      @product.store_name = 'a' * 65
      expect(@product).not_to be_valid
    end

    it 'should return an error for empty store section id' do
      @product.store_section_id = nil
      expect(@product).not_to be_valid
    end

    it 'should return an error for invalid purchased value' do
      @product.purchased = nil
      expect(@product).not_to be_valid
    end

    it 'should return an error for non-integer quantity' do
      @product.quantity = 'abc'
      expect(@product).not_to be_valid
    end

    it 'should be valid with valid attributes' do
      expect(@product).to be_valid
    end
  end

  describe 'associations' do
    it 'should belong to a store section' do
      association = described_class.reflect_on_association(:store_section)
      expect(association.macro).to eq :belongs_to
    end
  end
end