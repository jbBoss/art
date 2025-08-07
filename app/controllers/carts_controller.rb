# app/controllers/carts_controller.rb

class CartsController < ApplicationController
    # Add this line to require a user to be logged in
  before_action :authenticate_user!
  # This line "rescues" the app from crashing if a user tries
  # to access a product that doesn't exist.
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_product

  # GET /cart
  def show
    session[:cart] ||= {}
    cart_ids = session[:cart].keys
    @cart_items = Product.where(id: cart_ids)

    @subtotal = 0
    @cart_items.each do |item|
      @subtotal += item.price_in_cents * session[:cart][item.id.to_s]
    end

    # Make the province object available to the view
    @province = current_user.province

    # Calculate taxes using the province object
    @gst = @subtotal * (@province.gst_rate || 0)
    @pst = @subtotal * (@province.pst_rate || 0)
    @hst = @subtotal * (@province.hst_rate || 0)

    @total = @subtotal + @gst + @pst + @hst
  end

  # POST /cart/add/:product_id
  def add_item
    # Initialize cart in session if it doesn't exist yet
    session[:cart] ||= {}
    product_id = params[:product_id].to_s

    # Add the product to the cart or increment its quantity
    session[:cart][product_id] = (session[:cart][product_id] || 0) + 1

    redirect_to cart_path, notice: "Added to cart!"
  end

  # DELETE /cart/remove/:product_id
  def remove_item
    product_id = params[:product_id].to_s
    session[:cart].delete(product_id)

    redirect_to cart_path, notice: "Item removed."
  end
   # app/controllers/carts_controller.rb

# ... (keep the show, add_item, remove_item actions)

  def increase_quantity
    product_id = params[:product_id].to_s
    session[:cart][product_id] += 1
    redirect_to cart_path
  end

  def decrease_quantity
    product_id = params[:product_id].to_s
    session[:cart][product_id] -= 1

    # Remove item completely if quantity reaches 0
    session[:cart].delete(product_id) if session[:cart][product_id] <= 0

    redirect_to cart_path
  end
  private

  def invalid_product
    logger.error "Attempt to access invalid product."
    redirect_to root_path, notice: "That product doesn't exist."
  end
end