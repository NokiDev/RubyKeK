class User < ActiveRecord::Base #User(Model) Inherit from ActiveRecord::Base it's a basic model class

  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true
  validates :activation_key, presence:true
  # Used tko allow creation of an item they are required arguments

  has_many :tickets

  def self.authenticate(email, password)
    @user = User.find_by(email: email, password: password)
    if @user
      @user
    else
      nil
    end

  end
end