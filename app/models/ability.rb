class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can [:abouts, :reviews, :folktales, :tourism_articles, :location_tourisms, :events, :tips_tricks], User
    cannot :access, :rails_admin
    cannot :dashboard
    cannot :read, User, state: :disabled
    cannot :read,
      [LocationTourism, Folktale, TourismArticle, Event, TipsTrick], :state => 'unpublished'
    can :create, Contact
    
    if user
      can :like, Event
      can :search, TourismArticle

      if user.is? :member
        can [:read, :update, :destroy], TourismArticle, user_id: user.id
        can [:create, :update],
          [TourismArticle, Comment, Folktale, LocationTourism, Event, TipsTrick]
        can :create_comment,
          [TourismArticle, Folktale, LocationTourism, Event, TipsTrick]
        can [
          :new_tourism_article, :create_tourism_article,
          :edit_tourism_article, :update_tourism_article, :destroy_tourism_article,

          :new_folktale, :create_folktale,
          :new_event, :create_event,

          :new_location_tourism, :create_location_tourism,
          :edit_location_tourism, :update_location_tourism,
          
          :new_tips_trick, :create_tips_trick,
          :edit_about, :update_about
        ],
          User, :id => user.id
      end

      if user.is? :operator
        can :access, :rails_admin
        can :dashboard
        can :manage,
          [Contact, TourismArticle, Comment, Folktale, CategoryLocTourism, LocationTourism, Event, TipsTrick]
      end

      if user.is? :admin
        can :access, :rails_admin
        can :dashboard
        can :manage, :all
        cannot [:approve, :destroy, :create, :reject, :update], DeletionRequest
        can [:approve, :reject], DeletionRequest, state: "pending"
        can :destroy, DeletionRequest, state: %w[approved rejected]
      end

      cannot :like, Event, likes: {user_id: user.id}
    end

    cannot :destroy, user
  end

  #  def initialize(user)
  # Define abilities for the passed in user here. For example:
  #
  #   user ||= User.new # guest user (not logged in)
  #   if user.admin?
  #     can :manage, :all
  #   else
  #     can :read, :all
  #   end
  #
  # The first argument to `can` is the action you are giving the user permission to do.
  # If you pass :manage it will apply to every action. Other common actions here are
  # :read, :create, :update and :destroy.
  #
  # The second argument is the resource the user can perform the action on. If you pass
  # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
  #
  # The third argument is an optional hash of conditions to further filter the objects.
  # For example, here the user can only update published articles.
  #
  #   can :update, Article, :published => true
  #
  # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  #  end
end
