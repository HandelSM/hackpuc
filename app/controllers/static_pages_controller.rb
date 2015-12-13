class StaticPagesController < ApplicationController
  def home
  	if logged_in? then
  		redirect_to lawNext_url and return
  	else
  		redirect_to login_url and return
  	end
  end

end
