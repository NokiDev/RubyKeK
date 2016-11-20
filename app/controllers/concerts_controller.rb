
class ConcertsController < ApplicationController
  def new
    render :action => "new"
  end

  def index
    render :action => "display"
  end

  def create
    render plain: debug(params)
  end
end