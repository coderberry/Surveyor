class SurveyQuestionOption < ActiveRecord::Base
  belongs_to :survey_question
  validates_presence_of :question_response
  validates_uniqueness_of :question_response, :scope => :survey_question_id
  
  def answers
    SurveyeeAnswer.find(:all, :conditions => ["survey_question_option_id = ?", id])
  end
end
