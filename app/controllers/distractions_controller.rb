class DistractionsController < ApplicationController
  respond_to :html, :json
	before_filter :authenticate_user!

	def new
		@distraction = Distraction.new
	end

	def create
		@sesh = Sesh.find(params[:sesh_id])
		@distraction = Distraction.new(sesh_id: @sesh.id)
		
		if @distraction.save
			redirect_to sesh_path(@sesh), notice: "Distraction saved successfully."
		else
			redirect_to sesh_path(@sesh), notice: "Distraction could not be saved!"
		end
	end
end
