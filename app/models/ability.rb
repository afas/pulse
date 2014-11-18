class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    end
    if user.editor?
      can [:edit, :create], Publication
    end
    if user.author?
      can [:edit, :create, :user_publications, :user_drafts, :user_ready, :user_rejected, :create], Publication
    else
      can :read, :all
      can :short_name, Page
      can [:by_category, :by_type, :by_region], Publication
    end

    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
