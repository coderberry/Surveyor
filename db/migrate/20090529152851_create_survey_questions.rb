class CreateSurveyQuestions < ActiveRecord::Migration
  def self.up
    create_table :survey_questions do |t|
      t.integer :survey_id
      t.string  :question
      t.string  :response_type
    end
    add_index :survey_questions, :survey_id
  end

  def self.down
    drop_table :survey_questions
  end
end
