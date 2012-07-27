class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can [:read, :abouts, :reviews, :folktales, :events, :tips_tricks], User
    cannot :access, :rails_admin
    cannot :dashboard
    cannot :manage, User, :state => 'disabled'
    cannot :read,
      [LocationTourism, Folktale, TourismArticle, Event, TipsTrick], :state => 'unpublished'
    can :read,
      [LocationTourism, Folktale, TourismArticle, Event, TipsTrick], :state => 'published'
    can :create, Contact

    if user
      if user.is_any_of? :member, :operator
        can [:create, :update, :destroy],
          [TourismArticle, Comment, Folktale, LocationTourism, Event, TipsTrick], user_id: user.id
        can :update, LocationTourism
      end

      if user.is? :member
        can :create_comment,
          [TourismArticle, Folktale, LocationTourism, Event, TipsTrick]
        can [
          :new_folktale, :create_folktale,
          :new_event, :create_event,
          :new_tips_trick, :create_tips_trick,
          :edit_about, :update_about
        ], User, :id => user.id
      end

      if user.is? :operator
        can [
          :new_folktale, :create_folktale,
          :new_event, :create_event,
          :new_tips_trick, :create_tips_trick,
          :edit_about, :update_about
        ], User, :id => user.id
        can :access, :rails_admin
        can :dashboard
        cannot :manage, [SumbarContent, Setting, Slideshow, Profile]
        can [:read], User
        can :manage,
          [Contact, TourismArticle, TourismArticleRevision, Comment, Folktale,
          CategoryLocTourism, LocationTourism, LocationTourismRevision, Event, TipsTrick]
      end

      if user.is? :admin
        can :access, :rails_admin
        can :dashboard
        can :manage, :all
      end

      if user.is_any_of? :admin, :operator
        cannot [:approve, :destroy, :create, :reject, :update], [DeletionRequest, TourismArticleRevision, LocationTourismRevision]
        can [:approve, :reject], [DeletionRequest, TourismArticleRevision, LocationTourismRevision], state: "pending"
        can :destroy, [DeletionRequest, TourismArticleRevision, LocationTourismRevision], state: %w[approved rejected]

        cannot [:publish, :unpublish], [TourismArticle, LocationTourism]
        can :publish, [TourismArticle, LocationTourism], state: "unpublished"
        can :unpublish, [TourismArticle, LocationTourism], state: "published"
      end

      cannot :approve, [DeletionRequest, TourismArticleRevision, LocationTourismRevision], state: "approved"
      cannot :reject, [DeletionRequest, TourismArticleRevision, LocationTourismRevision], state: "rejected"
      cannot :publish, [TourismArticle, LocationTourism], state: "published"
      cannot :unpublish, [TourismArticle, LocationTourism], state: "unpublished"
      can :like, Event
      cannot :like, Event, likes: {user_id: user.id}
      can :search, TourismArticle
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
end
