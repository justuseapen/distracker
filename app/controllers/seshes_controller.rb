class SeshesController < ApplicationController
  respond_to :html, :json
	before_action :set_sesh, :authenticate_user!,
    only: [:show, :edit, :update, :destroy]

	def index
		@seshes = current_user.seshes
    respond_with(@seshes)
	end

	def show
		@sesh = Sesh.find(params[:id])
    if current_user != @sesh.user
      redirect_to root_path, notice: 'STOP HACKING AT ME SWAN!'
    end
    @distraction = Distraction.new(sesh_id: @sesh.id)
    respond_to do |format|
      format.html
      format.json { render json: @sesh }
    end
	end

	def new
		@sesh = current_user.Sesh.build
	end

	def edit
		@sesh
	end

	def create
    Time.zone = 'EST'
    @sesh = current_user.seshes.build(sesh_params)

    if @sesh.update(sesh_params)
      flash[:notice] = 'Sesh was successfully created.' if @sesh.save
      respond_with(@sesh)
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
