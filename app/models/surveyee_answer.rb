class SurveyeeAnswer < ActiveRecord::Base
  belongs_to :survey_question
  has_one :surveyee
  belongs_to :survey_question_option
  
  
  validates_presence_of :survey_question_id, :surveyee_id
end