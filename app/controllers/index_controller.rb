class  IndexController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	def index
		if logged_in?
			redirect_to semLeis_url
		else
			render 'index/index'
		end
	end
end
