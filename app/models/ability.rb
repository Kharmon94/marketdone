class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else

        # Convo


        can :create, PersonalMessage
        can :read, PersonalMessage do |personal|
            personal.user == user
        end

        can :create, Conversation
        can :read, Conversation do |convo|
            convo.author_id = user
        end


        # # Review

        can :create, Review
        can :destroy, Review do |review|
            review.user == user
        end
        can :read, Review

        # # Users
        can :read, User



        # # Orders

        can :create, Order
        can :shipped, Order do |order|
            order.seller == user 
        end
        can :new, Order
        can :sales, Order do |order|
            order.seller == user
        end
        can :purchases, Order do |order|
            order.buyer == user
        end
        can :read, Order do |order|
            order.seller == user || order.buyer == user
        end

        # Business

        can :destroy, Business do |business|
            business.user == user
        end  
        can :update, Business do |business|
            business.user == user
        end    
        can :create, Business
        can :new
        can :read, Business

        #Product

        can :destroy, Product do |product|
            product.user == user
        end  
        can :update, Product do |product|
            product.user == user
        end    
        can :create, Product 
        can :new, Product
        can :read, Product

        # can :read, :all
        
      end
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
  end
end
