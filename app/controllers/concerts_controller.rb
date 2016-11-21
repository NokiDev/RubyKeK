
class ConcertsController < ApplicationController
  def new
    render :action => "new"
  end

  def index
    @concerts = Concert.all
  end

  def show
    @concert = Concert.find(params[:id])
    render :action => "display"
  end

  def create
    @concert = Concert.new(concert_params)
    @concert.save
    redirect_to concerts_url
  end

  private
    def concert_params
      params.require(:concert).permit(:name, :date, :remaining_tickets, :price, :style, :address, :description)
    end
end