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
end
