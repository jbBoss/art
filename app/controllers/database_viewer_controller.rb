class DatabaseViewerController < ApplicationController
  def index
    @tables = ActiveRecord::Base.connection.tables.reject do |t|
      t == "schema_migrations" || t == "ar_internal_metadata"
    end
  end

  def show
    @table_name = params[:table_name]
    begin
      @columns = ActiveRecord::Base.connection.columns(@table_name).map(&:name)
      @rows = ActiveRecord::Base.connection.exec_query("SELECT * FROM #{@table_name}")
    rescue ActiveRecord::StatementInvalid => e
      flash[:alert] = "Error loading table: #{e.message}"
      redirect_to database_viewer_path
    end
  end
end
