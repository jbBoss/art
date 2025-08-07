class ProductsController < InheritedResources::Base

  def index
    # Start with all products, ordered by most recently created
    @products = Product.order(created_at: :desc)

    # Filter by name if the search_by_name parameter is present
    if params[:search_by_name].present?
      # Using LIKE for SQLite compatibility.
      @products = @products.where("name LIKE ?", "%#{params[:search_by_name]}%")
    # Otherwise, filter by category if the category_id parameter is present
    elsif params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end

    # This will now render the index.html.erb view with the potentially filtered @products
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price_in_cents, :active, :category_id, :main_image)
    end

end
