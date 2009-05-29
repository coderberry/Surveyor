class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.string :name
      t.string :unique_code
    end
  end

  def self.down
    drop_table :surveys
  end
end
