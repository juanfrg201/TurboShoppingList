# spec/models/store_section_spec.rb
require 'rails_helper'

RSpec.describe StoreSection, type: :model do
  before(:each) do
    @store_section = StoreSection.create!(name: 'Meat')
  end

  describe 'validations' do
    it 'should return an error for invalid name format' do
      @store_section.name = 'nombre@no'
      expect(@store_section).not_to be_valid
    end

    it 'should be valid with a valid name format' do
      expect(@store_section).to be_valid
    end
  end

  describe 'associations' do
    it 'should have many products' do
      association = described_class.reflect_on_association(:products)
      expect(association.macro).to eq :has_many
    end
  end
end
