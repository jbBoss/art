class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:status, :total_in_cents, :stripe_payment_id, :user_id)
    end

end
