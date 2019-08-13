# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Category, Product]
    user ||= User.new
    if user.is_admin?
      can :manage, [Category, Product, Myimage]
      #can [:create, :new, :read, :update, :destroy], Category
    elsif user.is_normal_user?
      can :read, :all 
    end 
  end
end
