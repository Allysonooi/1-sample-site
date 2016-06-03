class AdminController < ApplicationController
  layout "adm"
  before_action :authenticate_admin!
  
  def index
  end
end
