class ExceptionsController < ApplicationController
  protect_from_forgery

  def create
    throw "............"
    render json: {}, status: 200
  end
end
