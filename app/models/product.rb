class Product < ApplicationRecord
  belongs_to :store_section, optional: true

  # validations
  validates :name, presence: true, length: { maximum: 128 }, format: { without: /[%$&@+|]/ }
  validates :purchase_date, presence: true
  validates :store_name, length: { maximum: 64 }
  validates :store_section_id, presence: true, numericality: true
  validates :purchased, inclusion: { in: [true, false] }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
