class Product < ApplicationRecord
  belongs_to :category
  has_many :ordered_items
  has_one_attached :main_image # Add this line
  validates :name, :price_in_cents, presence: true
end
