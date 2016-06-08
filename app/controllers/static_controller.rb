class StaticController < ApplicationController
  layout "index"
  require 'securerandom'

  def ajax_submit_email
    if email_unique?(params[:email])
      r = Record.new(email: params[:email])
      r.name = params[:name]
      r.save
      @success = "Successfully saved!" # TODO: change string
    else
      @error = "Sorry, the email is already used!" # TODO: change string
    end

    # rails way
    # r = Record.new
    # r.email = params[:email]
    # r.coupon_code = "eps57554e2" + SecureRandom.hex(3) + "gwd"
    # if r.save # checks if email is unique
    #   @success
    # else
    #   @error = "Email already used" # chagne string
    # end
  end

  private
    def email_unique?(email_param)
      Record.where(email: email_param).empty?
    end
end
