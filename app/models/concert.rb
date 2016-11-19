
class Concert < ActiveRecord::Base

  validates :name, presence: true
  validates :date, presence: true
  validates :remaining_tickets, presence: true
  validates :price, presence: true
  validates :style, presence: true
  validates :address, presence: true
  validates :desription, presence: true

end