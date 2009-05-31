# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090531230831) do

  create_table "survey_question_options", :force => true do |t|
    t.integer "survey_question_id"
    t.string  "question_response"
  end

  add_index "survey_question_options", ["survey_question_id"], :name => "index_survey_question_options_on_survey_question_id"

  create_table "survey_questions", :force => true do |t|
    t.integer "survey_id"
    t.string  "question"
    t.string  "response_type"
  end

  add_index "survey_questions", ["survey_id"], :name => "index_survey_questions_on_survey_id"

  create_table "surveyee_answers", :force => true do |t|
    t.integer  "survey_question_id"
    t.integer  "surveyee_id"
    t.integer  "survey_question_option_id"
    t.text     "open_response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveyee_answers", ["survey_question_id"], :name => "index_surveyee_answers_on_survey_question_id"
  add_index "surveyee_answers", ["survey_question_option_id"], :name => "index_surveyee_answers_on_survey_question_option_id"
  add_index "surveyee_answers", ["surveyee_id"], :name => "index_surveyee_answers_on_surveyee_id"

  create_table "surveyees", :force => true do |t|
    t.integer  "survey_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveyees", ["survey_id"], :name => "index_surveyees_on_survey_id"

  create_table "surveys", :force => true do |t|
    t.string "name"
    t.string "unique_code"
    t.text   "description"
  end

end
