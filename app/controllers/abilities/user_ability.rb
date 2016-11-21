
class UserAbility

  #include CanCan::Ability

  def initialize(user)
    user ||= User.new('Guest')# guest user (not logged in)
    if user.admin? #Admin user
      can :manage, :all

    else if user.notGhost? #Logged User
      can :manage, User, :id => user.id
      can :read, User
      can :read, Concert
      can :manage, Comment, :author_id => user.id
    end
    #else #Guests
     # can :create, User
     # can :read, Concert
    end
  end

end