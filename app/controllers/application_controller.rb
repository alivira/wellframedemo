class ApplicationController < ActionController::Base
  before_filter :signed_in_user

  protect_from_forgery
  include SessionsHelper
  
  def adminCheck
    if current_user.admin
    else 
      redirect_to care_managers_url
      flash[:warning] = "You do not have permissions to access that page"
    end
  end

  def signed_in_user
  	if not signed_in?
  		flash[:warning] = "Please sign in"
      redirect_to signin_url
  	end
  end

end
