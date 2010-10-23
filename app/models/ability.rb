class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    elsif user.role? :specialist
      can :read, [Person, Answer]
      can :create, [Person, Answer]
      can :update, Person do |person| 
        person.try(:user) == user
      end
      can :update, Answer do |answer|
        answer.try(:user) == user
      end
    else
      can :read, [Person, Answer]
    end
  end
end
