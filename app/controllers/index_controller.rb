class  IndexController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	def index
		if logged_in?
		else
			render 'index/index'
		end
	end
end
