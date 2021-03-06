class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is_a? Admin
      can :manage, :all
    elsif user.is_a? User
      can :read, Book
      can :manage, Checkout
      can [:read, :update], Cart, user_id: user.id

      unless user.new_record?
        can [:read, :create, :update], Order, user_id: user.id
        can [:create, :update], ShippingAddress
        can [:create, :update], BillingAddress
        can [:create, :update], UserInfo
        can :update, OrderItem
        can [:create], Payment
        can :create, Review
        can :destroy, Review, user_id: user.id
      end
    end

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
  end
end
