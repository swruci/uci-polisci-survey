class SurveyResponsesController < ApplicationController
  before_action :set_survey

  def index
    @responses = @survey.responses.all
  end

  def create
    answers = []
    params["answers"].each do |question_id, answer_description|
      question = Question.find(question_id)
      # TODO: Check if answer has any data associated with it
      @answer = Answer.create(description: answer_description)
      question.answers << @answer
      answers << @answer
    end
    @survey_response = SurveyResponse.new(survey: @survey)
    @survey_response.answers << answers
    # Fail if you can't
    if @survey_response.save
      redirect_to survey_survey_responses_path @survey
      flash[:success] = 'Survey response was successfully created.'
    else
      render :new
    end
  end

  private
    def set_survey
      @survey = Survey.find(params[:survey_id])
    end
end
