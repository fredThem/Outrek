class DutyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def claim?
    true
  end

  def destroy?
    true
  end
end
