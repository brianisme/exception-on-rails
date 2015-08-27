class ExceptionsController < ApplicationController
  # protect_from_forgery

  def create
    p = Product.create(name: 'updater inc')
    p.save!
    # throw ActiveRecord::RecordNotFound
    # render json: {}, status: 200
  end

  def show
    p = Product.create(name: 'too short')
    p.save!
    # render json: {}, status: 200
  end

end
