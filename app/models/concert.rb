
class Concert < ActiveRecord::Base

  validates :name, presence: true
  validates :date, presence: true
  validates :remaining_tickets, presence: true
  validates :price, presence: true
  validates :style, presence: true
  validates :address, presence: true
  validates :description, presence: true

  has_many :comments
end