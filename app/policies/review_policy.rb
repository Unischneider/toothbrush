class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    true
  end

  def edit?
    true
  end

  def create?
    true
  end
end
