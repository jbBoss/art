class OrderedItemsController < InheritedResources::Base

  private

    def ordered_item_params
      params.require(:ordered_item).permit(:quantity, :price_in_cents, :order_id, :product_id)
    end

end
