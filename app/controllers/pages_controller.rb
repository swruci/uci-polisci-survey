class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :set_survey

  def index
    @pages = @survey.pages.all
  end

  def show
  end

  def new
    @page = @survey.pages.new
  end

  def edit
  end

  def create
    @page =  @survey.pages.new(page_params)

    if @page.save
      redirect_to edit_survey_path(@survey)
      flash[:success] = 'Page was successfully created.'
    else
      render :new
    end
  end

  def update

    if @page.update(page_params)
      redirect_to survey_page_path(@survey, @page)
      flash[:success] = 'Page was successfully updated.'
    else
      render :edit
    end

  end

  def destroy
    @page.destroy

    redirect_to edit_survey_path(@survey)
    flash[:success] = 'Page was successfully destroyed.'

  end

  private

    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:pagenum)
    end

end
