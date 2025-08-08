class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
         def self.ransackable_attributes(auth_object = nil)
    # List all attributes you want to be searchable via ActiveAdmin filters here.
    # Make sure to exclude sensitive fields such as password, tokens, etc.
    %w[
      id
      email
      created_at
      updated_at
      # add more attributes if needed, like name, role, etc.
    ]
  end
  def name
    # Returns a default name for the admin
    "Administrator"
  end

  def address
    # You can return a default address or an empty string
    "123 Admin Way, Winnipeg, MB"
  end

  def province
    # Return a default province or nil.
    # It might be best to find and return the Manitoba province object.
    Province.find_by(name: "Manitoba")
  end
end
