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
      cannot :read, Event, published: false||nil
      cannot :read, Conference, published: false||nil 
      cannot :read, Year, published: false||nil
    end
  end

  private 

    def get_user(user_data)
      if user_data.is_a?(Hash)
        User.new(user_data)
      elsif user_data.is_a?(Admin)
        Admin.new('role' => User::ADMIN)
      else  
        User.new('role' => User::GUEST)
      end     
    end 
end
