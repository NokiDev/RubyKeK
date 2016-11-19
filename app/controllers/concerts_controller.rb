
class ConcertsController < ApplicationController
  def new

  end

  def create
    render plain: params[:concert].inspect
  end
end