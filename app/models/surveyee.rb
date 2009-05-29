class Surveyee < ActiveRecord::Base
  belongs_to :survey
  has_many :surveyee_answers
  validates_presence_of :name, :email, :survey_id
  validates_uniqueness_of :email, :scope => :survey_id, :message => "has already registered"
  
  def add_answer(question_id, answer)
    question = SurveyQuestion.find(question_id)
    sa = surveyee_answers.build
    sa.survey_question_id = question.id
    if question.response_type == "OPTION"
      sa.survey_question_option_id = answer
    else
      sa.open_response = answer
    end
    sa.save!
  end
end
