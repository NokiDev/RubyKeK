
class Ticket < ActiveRecord::Base

  validates :user_id, presence: true
  validates :concert_id, presence: true
  validates :price, presence: true
  validates :bougth_date, presence: true

  has_one :concert
  has_one :user

end