ActiveAdmin.register User do
  # To prevent N+1 queries, include the province association
  includes :province

  # Define which attributes can be edited by the admin
  permit_params :email, :name, :address, :province_id, :password, :password_confirmation

  # --- FILTERS ---
  # Add filters for searchable attributes on the sidebar
  filter :name
  filter :email
  filter :address # <--- Added filter for address
  filter :province

  # Customize the main index page (list of all users)
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :address # <--- Added address to the list view
    column :province
    column :created_at
    actions
  end

  # Customize the form for creating and editing a user
  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :address
      f.input :province, as: :select
    end
    f.inputs "Change Password" do
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  # Controller logic to handle optional password updates
  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end
end