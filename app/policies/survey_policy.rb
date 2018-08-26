class SurveyPolicy < ApplicationPolicy
  def index?
  end

  def create?
    user.present?
  end
end
