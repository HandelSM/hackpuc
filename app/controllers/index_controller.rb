class  IndexController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	def index
		if logged_in?
			redirect_to lawNext_url and return
		end
	end
end
