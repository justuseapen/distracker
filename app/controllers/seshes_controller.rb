class SeshesController < ApplicationController
	before_action :set_sesh,:authenticate_user!, except: [:index, :show], only: [:show, :edit, :update, :destroy]

	def index
		@seshes = current_user.seshes
	end

	def show
		@sesh = Sesh.find(params[:id])
    @distraction = Distraction.new(sesh_id: @sesh.id)
	end

	def new
		@sesh = current_user.Sesh.build
	end

	def edit
		@sesh
	end

	def create
    @sesh = current_user.seshes.build(sesh_params)

    if @sesh.update(sesh_params)
      redirect_to @sesh, notice: 'Sesh was successfully created.'
    else
      redirect_to root_path, notice: 'Sesh name is REQUIRED, bro. Like, totally mandatory, sorry.'
    end
  end

  def update
    @sesh.ended_at = Time.now

    if @sesh.save
      redirect_to root_path, notice: 'Sesh was successfully ended.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @sesh.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sesh
    @sesh = Sesh.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sesh_params
    params.require(:sesh).permit(:name, :ended_at)
  end

end
