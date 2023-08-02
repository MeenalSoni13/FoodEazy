class Ability
    include CanCan::Ability
    
    def initialize(user)
    user ||= User.new
    
    
    if user.admin?
      can :manage, Restaurant
      can :manage, Fooditem
      can :manage, Cartitem
      can :manage, Cart
      can :manage, Order
    else 
      can :read, Restaurant
      can :read, Fooditem
      can :read, Cartitem
      can :read, Cart
      can :read, Order
    end 
  end
end