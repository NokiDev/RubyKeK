
class TicketsController

  def create#Called when buying a ticket on the concert/:id page
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id
    @ticket.concert_id = params[:concert_id]

    @ticket.save

    redirect_to controller: 'concerts', action: 'show', id: @ticket.concert_id
  end

private
  def ticket_params
    params.require(:user).permit(:username,:password,:mail,:first_name,:last_name,:age)
  end

end