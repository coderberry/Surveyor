module Admin::SurveyQuestionsHelper
  
  def fields_for_survey_question_option(survey_question_option, &block)
    prefix = survey_question_option.new_record? ? 'new' : 'existing'
    fields_for("survey_question[#{prefix}_survey_question_option_attributes][]", survey_question_option, &block)
  end

  def add_survey_question_option_link(name) 
    link_to_function name do |page| 
      page.insert_html :bottom, :survey_question_options, :partial => 'survey_question_option', :object => SurveyQuestionOption.new 
    end 
  end
    
end
