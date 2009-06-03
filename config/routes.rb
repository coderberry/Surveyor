ActionController::Routing::Routes.draw do |map|  
  map.survey 'survey/:unique_code', :controller => 'survey', :action => 'index'
  map.survey_questions 'survey/:unique_code/questions', :controller => 'survey', :action => 'questions'
  map.survey_thank_you 'survey/:unique_code/thank_you', :controller => 'survey', :action => 'thank_you'
  map.namespace :admin do |admin|
    admin.resources :surveys, :has_many => [ :survey_questions, :surveyees ]
  end
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
