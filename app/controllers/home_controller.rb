class HomeController < ApplicationController
  
  before_action :logged_in_redirect, only: [:top]
  
  
  def top
  end
  
  def menu
  end
  
  private 
   def logged_in_redirect
     if user_signed_in?
       redirect_to users_path
     end
   end
  
end
