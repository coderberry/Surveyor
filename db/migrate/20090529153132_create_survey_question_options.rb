class CreateSurveyQuestionOptions < ActiveRecord::Migration
  def self.up
    create_table :survey_question_options do |t|
      t.integer :survey_question_id
      t.string  :question_response
    end
    add_index :survey_question_options, :survey_question_id
  end

  def self.down
    drop_table :survey_question_options
  end
end
