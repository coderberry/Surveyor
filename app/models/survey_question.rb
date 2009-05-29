class SurveyQuestion < ActiveRecord::Base
  
  RESPONSE_TYPES = %w( OPTION OPEN )
  
  belongs_to :survey  
  has_many :survey_question_options, :dependent => :destroy
  has_many :surveyee_answers
  
  validates_presence_of :survey_id, :question, :response_type
  validates_inclusion_of :response_type, :in => RESPONSE_TYPES
  
  after_save :save_survey_question_options
  
  def responses
    SurveyeeAnswer.find(:all, :conditions => { :survey_question_id => id })
  end
  
  def new_survey_question_option_attributes=(survey_question_option_attributes)
    survey_question_option_attributes.each do |attributes|
      survey_question_options.build(attributes)
    end
  end
  
  def existing_survey_question_option_attributes=(survey_question_option_attributes)
    survey_question_options.reject(&:new_record?).each do |survey_question_option|
      attributes = survey_question_option_attributes[survey_question_option.id.to_s]
      if attributes
        survey_question_option.attributes = attributes
      else
        survey_question_options.delete(survey_question_option)
      end
    end
  end
  
  def save_survey_question_options
    survey_question_options.each do |survey_question_option|
      survey_question_option.save(false)
    end
  end
  
end
