class Survey < ActiveRecord::Base
  has_many :survey_questions, :dependent => :destroy
  has_many :surveyees, :dependent => :destroy
  validates_presence_of :name, :unique_code
  validates_uniqueness_of :name, :unique_code
  before_validation :prepare_unique_code
  
  private
  
  def prepare_unique_code
    if self.unique_code.blank?
      self.unique_code = Digest::SHA1.hexdigest([Time.now, rand].join)
    end
  end
end
