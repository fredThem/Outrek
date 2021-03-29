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
    @user == @record.user
  end

  def update?
    @user == @record.user || @user == @record.invitations.user
  end

  def destroy?
    @user == @record.user
  end
end
