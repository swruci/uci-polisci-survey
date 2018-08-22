class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_survey

  # GET /questions
  # GET /questions.json
  def index
    @questions = @survey.questions.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = @survey.questions.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question =  @survey.questions.new(question_params)

    if @question.save
      # survey_question_path(@survey, @question)
      redirect_to [@survey, @question]
      flash[:success] = 'Question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update

      if @question.update(question_params)
        redirect_to survey_question_path(@survey, @question)
        flash[:success] = 'Question was successfully updated.'
      else
        render :edit
      end

  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy

    redirect_to edit_survey_path(@survey)
    flash[:success] = 'Question was successfully destroyed.'

  end

  private

    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      temp_params = params.require(:question).permit(:q_type, :description, :settings, :survey_id)
      temp_params[:settings] = JSON.parse(
        if temp_params[:settings].empty? then "{}" else temp_params[:settings] end)
      temp_params
    end
end
