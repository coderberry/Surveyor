class CreateSurveyees < ActiveRecord::Migration
  def self.up
    create_table :surveyees do |t|
      t.integer :survey_id
      t.string  :name
      t.string  :email
      t.timestamps
    end
    add_index :surveyees, :survey_id
  end

  def self.down
    drop_table :surveyees
  end
end
