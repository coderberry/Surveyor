class Survey < ActiveRecord::Base
  has_many :survey_questions, :dependent => :destroy
  has_many :surveyees, :dependent => :destroy
  validates_presence_of :name, :unique_code
  validates_uniqueness_of :name, :unique_code
  before_validation :prepare_unique_code
  
  def responses
    Surveyee.find(:all, :conditions => { :survey_id => id }, :order => "created_at ASC", :include => :surveyee_answers)
  end

  def responses_hash
    respondants = Surveyee.find(:all, :conditions => { :survey_id => id }, :order => "created_at ASC", :include => :surveyee_answers)
    answers = {}
    respondants.each do |resp|
      a = {}
      resp.surveyee_answers.each do |answer|
        a[answer.survey_question.question] = (answer.open_response.nil? ? answer.survey_question_option.question_response : answer.open_response)
      end
      answers[resp.id] = a
    end
    answers
  end
  
  private
  
  def prepare_unique_code
    if self.unique_code.blank?
      self.unique_code = Digest::SHA1.hexdigest([Time.now, rand].join)
    end
  end
end
