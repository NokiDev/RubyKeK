class User < ActiveRecord::Base #User(Model) Inherit from ActiveRecord::Base it's a basic model class

  validates :username, presence: true
  validates :password, presence: true
  validates :mail, presence: true
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :age, presence:true
  # Used tko allow creation of an item they are required arguments
  #todo loook in docs for more vars

  def todo
    #todo
  end

  def self.authenticate(email, password)
    @user = User.find_by_mail(email)
    if @user && password == @user.password
      @user
    else
      nil
    end
  end
end