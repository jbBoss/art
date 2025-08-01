class ProvincesController < InheritedResources::Base

  private

    def province_params
      params.require(:province).permit(:name, :gst_rate, :pst_rate, :hst_rate)
    end

end
