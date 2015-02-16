class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: User::GUEST) # guest user (not logged in)
    if user.role == User::ADMIN
      can :manage, :all
    elsif user.role == User::SPEAKER 
#      alias_action :edit, :create, :to => :update
      can :update, :all
      can :create, Event
    elsif user.role == User::GUEST
#      raise "I am guest"
      can :read, :all
      can :create, Speaker
    end
  end  
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  
end
