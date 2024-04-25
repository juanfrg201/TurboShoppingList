class StoreSection < ApplicationRecord
  has_many :products

  validates :name, presence: true, format: { with: /\A[\w\s]{1,64}\z/ }
end
