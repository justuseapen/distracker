class DistractionsController < ApplicationController

	def index
		@distractions = current_session.Distraction.all
	end

	def new
		@distraction = Distraction.new
	end

	def create
		@session = Session.find(params[:session_id])
		@distraction = Distraction.new(session_id: @session.id)
		if @distraction.save
			redirect_to session_path(@session), notice: "Distraction saved successfully."
		else
			redirect_to session_path(@session), notice: "Distraction could not be saved!"
			
		end
	end

end
