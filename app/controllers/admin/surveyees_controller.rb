class Admin::SurveyeesController < ApplicationController
  before_filter :load_survey

  def index
    @respondants = @survey.responses
    @answers = @survey.responses_hash

    respond_to do |wants|
      wants.html
      wants.csv do
        csv_string = FasterCSV.generate do |csv|
          #header
          a = ["name", "email"]
          @survey.survey_questions.each do |question|
            a << question.question
          end
          csv << a
          @respondants.each do |surveyee|
            a.clear
            a << surveyee.name
            a << surveyee.email
            @survey.survey_questions.each do |q|
              a << @answers[surveyee.id][q.question]
            end
            csv << a
          end
        end
        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=responses.csv"
      end
    end
  end

  private

  def load_survey
    @survey = Survey.find(params[:survey_id])
  end

end
