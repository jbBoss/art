# app/controllers/orders_controller.rb

class OrdersController < ApplicationController
  before_action :authenticate_user!

  # Action to list all of the current user's orders
  def index
    @orders = current_user.orders.includes(ordered_items: :product).order(created_at: :desc)
  end

  # Action to show the details of a single order
  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    # This action remains the same
    @cart_items = Product.where(id: session[:cart].keys)
    if @cart_items.empty?
      redirect_to root_path, alert: "Your cart is empty."
      return
    end
    @subtotal = 0
    @cart_items.each do |item|
      @subtotal += item.price_in_cents * session[:cart][item.id.to_s]
    end
    @province = current_user.province
    @gst = @subtotal * (@province.gst_rate || 0)
    @pst = @subtotal * (@province.pst_rate || 0)
    @hst = @subtotal * (@province.hst_rate || 0)
    @total = @subtotal + @gst + @pst + @hst
  end

  def create
    # This action remains the same
    cart_items = Product.where(id: session[:cart].keys)
    subtotal = 0
    cart_items.each do |item|
      subtotal += item.price_in_cents * session[:cart][item.id.to_s]
    end
    province = current_user.province
    gst = subtotal * (province.gst_rate || 0)
    pst = subtotal * (province.pst_rate || 0)
    hst = subtotal * (province.hst_rate || 0)
    total = subtotal + gst + pst + hst
    order = current_user.orders.create(
      status: "Paid",
      total_in_cents: total.to_i,
      stripe_payment_id: SecureRandom.alphanumeric(8)
    )
    if order.persisted?
      cart_items.each do |item|
        quantity = session[:cart][item.id.to_s]
        order.ordered_items.create(
          product: item,
          quantity: quantity,
          price_in_cents: item.price_in_cents
        )
      end
      session.delete(:cart)
      redirect_to order_path(order), notice: "Thank you for your order!" # Redirect to the new order's show page
    else
      redirect_to cart_path, alert: "There was an error processing your order."
    end
  end
end