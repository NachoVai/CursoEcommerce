# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_admin?
      can :manage, Category
      #can [:create, :new, :read, :update, :destroy], Category
    elsif user.is_normal_user?
      can :read, Category
    end 
  end
end
