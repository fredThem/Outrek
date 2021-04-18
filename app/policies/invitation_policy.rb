class InvitationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    @user == @record.trip.user
  end

  def edit?
    @user == @record.user || @user == @record.trip.user
  end

  def destroy?
    @user == @record.user
  end

  def accept?
    true
  end
end
