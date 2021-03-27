class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    # current_user == user
    true
  end

  def update?
    current_user == user || current_user == record.invitations.user
  end

  def destroy?
    current_user == user
  end
end
