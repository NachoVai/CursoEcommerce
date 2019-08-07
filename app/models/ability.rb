# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_admin?
      can :manage, [Category, Product]
      #can [:create, :new, :read, :update, :destroy], Category
    elsif
      can :read, [Category, Product]
    end 
  end
end
