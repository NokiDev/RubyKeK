
class Comment < ActiveRecord::Base
  validates :comment, presence: true
  validates :user_id, presence: true
  validates :concert_id, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true

  belongs_to :user

end