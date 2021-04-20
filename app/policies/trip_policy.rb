class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def show?
    # @user == @record.user || @record.invitations.select{ |invitation| invitation.user == @user} != []
    true
  end

  def update?
    @user == @record.user || @record.invitations.select{ |invitation| invitation.user == @user} != []
  end

  def destroy?
    @user == @record.user
  end
end
