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
    # We will get the product objects for the view here
    cart_ids = session[:cart].keys
    @cart_items = Product.where(id: cart_ids)
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

  private

  def invalid_product
    logger.error "Attempt to access invalid product."
    redirect_to root_path, notice: "That product doesn't exist."
  end
end