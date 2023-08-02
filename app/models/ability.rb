class Ability
  include CanCan::Ability
  
  def initialize(user)
  user ||= User.new
  
  
  if user.admin?
    can :manage, Restaurant
    can :manage, Fooditem
    
  else 
    can :read, Restaurant
    can :read, Fooditem
  end 
 end
end