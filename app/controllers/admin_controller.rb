class AdminController < ApplicationController
  layout "adm"
  before_action :authenticate_admin!

  def home
    respond_to do |format|
      format.html
      format.csv { send_data Record.to_csv }
      format.xls # {send_data @record.to_csv(col_sep: "\t")}
    end
  end
end
