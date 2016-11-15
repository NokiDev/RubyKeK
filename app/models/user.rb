class User < ActiveRecord::Base #User(Model) Inherit from ActiveRecord::Base it's a basic model class

  has_many :accounts #Means that there is many acounts in a bank (One to many rel)
  validates :name, presence: true # Used tko allow creation of an item they are required arguments
  #todo loook in docs for more vars

  def todo
    #todo
  end

end