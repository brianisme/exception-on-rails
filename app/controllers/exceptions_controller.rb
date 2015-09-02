class ExceptionsController < ApplicationController

  def create
    p = Product.create(name: 'updater inc')
    p.save!
  end

  def show
    p = Product.find(-1)
  end

end
