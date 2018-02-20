class ToothbrushPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def create
      true
    end

    def update
      user == record.user
    end
  end
end

