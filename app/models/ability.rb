class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    elsif user.role? :specialist
      can :read, [Person, Answer, Stype]
      can :show, User
      can :create, [Person, Answer]
      can :switcher, Stype
      can :rss, Person
      can :update, Person do |person| 
        person.try(:user) == user
      end
      can :update, Answer do |answer|
        answer.try(:user) == user
      end
    else
      can :switcher, Stype
      can :show, User
      can :read, [Person, Answer, Stype]
      can :rss, Person
    end
  end
end
