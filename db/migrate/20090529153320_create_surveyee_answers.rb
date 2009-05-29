class CreateSurveyeeAnswers < ActiveRecord::Migration
  def self.up
    create_table :surveyee_answers do |t|
      t.integer :survey_question_id
      t.integer :surveyee_id
      t.integer :survey_question_option_id
      t.text    :open_response
      t.timestamps
    end
    add_index :surveyee_answers, :survey_question_id
    add_index :surveyee_answers, :surveyee_id
    add_index :surveyee_answers, :survey_question_option_id
  end

  def self.down
    drop_table :surveyee_answers
  end
end
