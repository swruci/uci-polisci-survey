class SurveyResponsesController < ApplicationController
  before_action :set_survey

  def index
    @responses = @survey.responses.all
        
    respond_to do |format|
      format.html
      format.json  { render :json => @responses.to_json }
    end
  end

  def create
    answers = []
    params["answers"].each do |question_id, answer_description|
      question = Question.find(question_id)
      # TODO: Check if answer has any data associated with it
      if params.has_key?('qid') && question_id == params["qid"]
        answer_description += params['q1']+'; '+params['q2']+'; '+params['q3']+'; '+params['q4']
      end
      @answer = Answer.create(description: answer_description)
      question.answers << @answer
      answers << @answer
    end
    @survey_response = SurveyResponse.new(response_params)
    @survey_response.answers << answers
    # Fail if you can't
    if @survey_response.save
      ran1 = ''
      ran2 = ''
      unless params['ran_1'].blank? && params['ran_2'].blank?
        ran1 = params['ran_1']
        ran2 = params['ran_2']
      end
      redirect_to thankyou_survey_survey_responses_path(@survey, :ran1 => ran1, :ran2 => ran2)
      flash[:success] = 'Survey response was successfully created.'
    else
      render :new
    end
  end

  private
    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

    def response_params
      tparams = params.permit(:participant)
      tparams[:survey] = @survey
      tparams
    end
end
