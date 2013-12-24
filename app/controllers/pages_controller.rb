class PagesController < ApplicationController

	def home
		@session = Session.new
		if user_signed_in?
			@sessions = current_user.sessions
		end
	end

end
