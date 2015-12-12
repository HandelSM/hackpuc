class  IndexController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


	def index
		if logged_in?
			randomID = rand(Law.all.count) + 1
    		@law = Law.find(randomID)
			render 'laws/show'
		else
			render 'index/index'
			
		end
	end


end
