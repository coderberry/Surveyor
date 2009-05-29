namespace :db do
  desc "Populate database with default survey"
  task :populate => :environment do
    
    # Create Survey
    survey = Survey.new(:name => "Workshop Invitational Survey")
    if survey.save
      survey.survey_questions.create!(
        :question => "Do you have a laptop?", 
        :response_type => "OPTION",
        :new_survey_question_option_attributes => [
            { :question_response => "Yes" },
            { :question_response => "No" }]
      )
      survey.survey_questions.create!(
        :question => "Which days do you prefer sessions to be held on?", 
        :response_type => "OPTION",
        :new_survey_question_option_attributes => [
            { :question_response => "Monday 12:30 & Wednesday 12:30" },
            { :question_response => "Wednesday 12:30 & Friday 12:00" }]
      )
      survey.survey_questions.create!(
        :question => "What is your current level of development experience?", 
        :response_type => "OPTION",
        :new_survey_question_option_attributes => [
            { :question_response => "Student" },
            { :question_response => "1-2 years" },
            { :question_response => "3-5 years" },
            { :question_response => "5+ years" }]
      )
      survey.survey_questions.create!(
        :question => "What is your current Ruby / Rails skill level?", 
        :response_type => "OPTION",
        :new_survey_question_option_attributes => [
            { :question_response => "Beginner" },
            { :question_response => "Intermediate" },
            { :question_response => "Advanced" }]
      )
      survey.survey_questions.create!(
        :question => "What is your current level of experience with web development?", 
        :response_type => "OPTION",
        :new_survey_question_option_attributes => [
            { :question_response => "Beginner" },
            { :question_response => "Intermediate" },
            { :question_response => "Advanced" }]
      )
      survey.survey_questions.create!(
        :question => "What is your current level of experience with testing?", 
        :response_type => "OPTION",
        :new_survey_question_option_attributes => [
            { :question_response => "Beginner" },
            { :question_response => "Intermediate" },
            { :question_response => "Advanced" }]
      )
      survey.survey_questions.create!(
        :question => "What are you most interested in learning and getting out of this workshop?", 
        :response_type => "OPEN"
      )
    else
      puts "Survey already exists"
    end
    
  end
end