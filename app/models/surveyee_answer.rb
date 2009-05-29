class SurveyeeAnswer < ActiveRecord::Base
  has_one :survey_question
  has_one :surveyee
  has_one :survey_question_option
  
  
  validates_presence_of :survey_question_id, :surveyee_id
end