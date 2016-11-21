
class ConcertsController < ApplicationController
  def new
    render :action => "new"
  end

  def index
    @concerts = Concert.all
  end

  def show
    @comments = Comment.all
    @concert = Concert.find(params[:id])
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