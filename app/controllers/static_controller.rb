class StaticController < ApplicationController
  layout "index"
  
  def ajax_submit_email
    r = Record.new(email: params[:email])
    r.save
  end
end
