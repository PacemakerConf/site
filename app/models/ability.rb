class Ability
  include CanCan::Ability

  def initialize(user_data)
    user = get_user(user_data)
    if user.role == User::ADMIN
      can :manage, :all
    elsif user.role == User::SPEAKER 
      can :create, Event
      can :create, Speaker
    elsif user.role == User::GUEST
      can :read, :all
      #can :create, Speaker
    end
  end

  private 

  def get_user(user_data)
    if user_data.blank?
      User.new('role': User::GUEST) # guest user (not logged in)
    elsif user_data.is_a?(Hash)
      User.new(user_data)
    else
      user_data
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
