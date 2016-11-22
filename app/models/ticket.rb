
class Ticket < ActiveRecord::Base
  after_save decrement_remaining_tickets

  validates :user_id, presence: true
  validates :concert_id, presence: true
  validates :price, presence: true
  validates :number_of, presence: true
  validates :bougth_date, presence: true

  has_one :concert
  has_one :user

private

  def decrement_remaining_tickets(ticket)
    concert = Concert.find(ticket.concert_id)
    concert.remaining_tickets -= ticket.number_of
    nil
  end

end