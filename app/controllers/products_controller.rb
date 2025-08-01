class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:name, :description, :price_in_cents, :active, :category_id, :main_image)
    end

end
