# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    $user
    # @user = Membership.where(user_role: user.id , user_id: user.id)
    
    if $user.role_id == 4 or $user.role_id == 1
      can :manage , Membership
    end

    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    # debugger
    # can :read , Employer do |e|
    #   debugger
    # end

  end

  def self.member(user_id , employer_id)
    $user = Membership.where(user_role: user_id , employer_id: employer_id).first
  end

end


