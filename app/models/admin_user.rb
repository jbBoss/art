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
end
