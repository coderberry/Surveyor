class SurveyController < ApplicationController
  before_filter :load_survey
  
  def index
    if request.post?
      @surveyee = @survey.surveyees.build(params[:surveyee])
      if @surveyee.save
        session[:surveyee_id] = @surveyee.id
        flash[:notice] = "You have registered successfully. Please fill out the survey below."
        redirect_to survey_questions_path(@survey.unique_code)
      end
    else
      @surveyee = @survey.surveyees.build
    end
  end
  
  def questions
    if session[:surveyee_id]
      @surveyee = Surveyee.find(session[:surveyee_id])
      if request.post?
        survey_questions = params["#{@survey.id}"]
        if survey_questions.length < @survey.survey_questions.length
          flash[:notice] = "Please answer all questions."
        else
          survey_questions.each do |key, value|
            @surveyee.add_answer(key, value)
          end
          redirect_to survey_thank_you_path and return
        end
      end
    else
      redirect_to survey_path(@survey.unique_code) and return
    end
  end
  
  def thank_you
    session[:surveyee_id] = nil
  end
  
  private
  
  def load_survey
    @survey = Survey.find_by_unique_code(params[:unique_code])
    unless @survey
      render :text => "NO SURVEY AVAILABLE"
    end
  end
end
