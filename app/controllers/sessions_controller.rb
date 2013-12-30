class SessionsController < ApplicationController
	before_action :set_session,:authenticate_user!, except: [:index, :show], only: [:show, :edit, :update, :destroy]

	def index
		@sessions = current_user.sessions
	end

	def show
		@session = Session.find(params[:id])
    @distraction = Distraction.new(session_id: @session.id)
	end

	def new
		@session = current_user.Session.build
	end

	def edit
		@session
	end

	def create
    @session = current_user.sessions.build(session_params)

    if @session.update(session_params)
      redirect_to @session, notice: 'Session was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @session.ended_at = Time.now

    if @session.save
      redirect_to root_path, notice: 'Session was successfully ended.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_session
    @session = Session.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def session_params
    params.require(:session).permit(:name, :ended_at)
  end

end
