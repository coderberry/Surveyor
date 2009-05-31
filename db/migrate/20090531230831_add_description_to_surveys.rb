class AddDescriptionToSurveys < ActiveRecord::Migration
  def self.up
    add_column :surveys, :description, :text
  end

  def self.down
    remove_column :surveys, :description
  end
end
