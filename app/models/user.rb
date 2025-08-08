class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  belongs_to :province, optional: true  # Make optional if users can register without province immediately
  has_many :orders

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # Admin flag
  # You can add convenience methods if you like:
  def admin?
    is_admin
  end
# user.rb

def self.ransackable_attributes(auth_object = nil)
  ["id", "email", "name", "address", "created_at", "updated_at", "province_id"]
end

  # This method tells ActiveAdmin which associated models are safe to search.
  def self.ransackable_associations(auth_object = nil)
    ["province"]
  end

end