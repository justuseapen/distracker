class DistractionsController < ApplicationController

	def index
		@distractions = current_session.Distraction.all
	end

	def new
		@distraction = Distraction.new
		if @distraction.save
			redirect_to '/sessions/show', notice: "Distraction saved successfully."
		else
			render @session.show
			notice: "Distraction couldn't be saved!."
		end
	end

	def create
		@distraction = Distraction.new
		if @distraction.save
			redirect_to '/sessions/show', notice: "Distraction saved successfully."
		else
			render @session.show
			notice: "Distraction could not be saved!"
		end
	end

end
