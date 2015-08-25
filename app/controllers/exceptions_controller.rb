class ExceptionsController < ApplicationController
  protect_from_forgery

  def create
    render json: {}, status: 200
  end
end
