class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # If I want to show only the ones I own
      # scope.where(user: user)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    # record: the restaurant passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise.
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
