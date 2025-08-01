class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_items
validates :status, :total_in_cents, presence: true
end
