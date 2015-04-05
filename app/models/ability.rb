class Ability
  include CanCan::Ability

  def initialize(user_data)
    user = get_user(user_data)
    if user.role == User::ADMIN
      can :manage, :all
    elsif user.role == User::SPEAKER 
      can :create, Event
      can :create, Speaker
      cannot :read, Event, published: false
      cannot :read, Conference, published: false
      cannot :read, Year, published: false
      cannot :read, Event, published: nil
      cannot :read, Conference, published: nil
      cannot :read, Year, published: nil 
    elsif user.role == User::GUEST
      can :read, :all
      cannot :read, Event, published: false
      cannot :read, Conference, published: false
      cannot :read, Year, published: false
      cannot :read, Event, published: nil
      cannot :read, Conference, published: nil
      cannot :read, Year, published: nil 
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
