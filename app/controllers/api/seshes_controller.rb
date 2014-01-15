class Api::SeshesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json
  
end