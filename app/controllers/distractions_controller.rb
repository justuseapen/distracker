class DistractionsController < ApplicationController

	def index
		@distractions = current_session.Distraction.all
	end

	def new
		@distraction = Distraction.new
	end

	def create
		@distraction = Distraction.build
		if @distraction.save
			redirect_to '/sessions/show', notice: "Distraction saved successfully."
		else
			redirect_to '/sessions/show', notice: "Distraction could not be saved!"
			
		end
	end

end
