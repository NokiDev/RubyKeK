
class TicketsController

  def create#Called when buying a ticket on the concert/:id page
    @ticket = Ticket.new(ticket_params)
    @ticket.bought_date = Time.now
    @ticket.save
    redirect_to controller: 'concerts', action: 'show', id: @ticket.concert_id
  end

private
  def ticket_params
    params.require(:ticket).permit(:user_id,:concert_id, :price)
  end

end