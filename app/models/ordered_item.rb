class OrderedItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

validates :quantity, :price_in_cents, presence: true
end
