class SurveyResponsesController < ApplicationController
  before_action :set_survey

  def create
    # build_answers, bind to the survey response
    # return response
  end

  private
    def build_answers
      # TODO: Implement
      # Build the answers, bind them to questions, return the answers
    end

    def set_survey
      @survey = Survey.find(params[:survey_id])
    end
end
