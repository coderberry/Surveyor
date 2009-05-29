class Admin::SurveyQuestionsController < AdminController
  before_filter :load_survey
  
  def index
    @survey_questions = @survey.survey_questions
  end
  
  def new
    @survey_question = @survey.survey_questions.build
    5.times { @survey_question.survey_question_options.build }
  end
  
  def create
    @survey_question = @survey.survey_questions.build(params[:survey_question])
    debugger
    if @survey_question.save
      flash[:notice] = "Successfully created survey question."
      redirect_to admin_survey_survey_questions_path(@survey)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @survey_question = @survey.survey_questions.find(params[:id])
  end
  
  def update
    params[:survey_question][:existing_survey_question_option_attributes] ||= {}
    @survey_question = @survey.survey_questions.find(params[:id])
    if @survey_question.update_attributes(params[:survey_question])
      flash[:notice] = "Successfully updated survey question."
      redirect_to admin_survey_survey_questions_path(@survey)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @survey_question = @survey.survey_questions.find(params[:id])
    @survey_question.destroy
    flash[:notice] = "Successfully destroyed survey question."
    redirect_to admin_survey_survey_questions_path(@survey)
  end
  
  private
  
  def load_survey
    @survey = Survey.find(params[:survey_id])
  end
end
