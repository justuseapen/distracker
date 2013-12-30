class PagesController < ApplicationController

	def home
		@sesh = Sesh.new
		if user_signed_in?
			@seshes = current_user.seshes
		end
	end

end
