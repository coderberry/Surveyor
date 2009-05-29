// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function toggleSurveyQuestionOptions() {
	if ($('#survey_question_response_type').val() == "OPTION") {
		$('#survey_question_options').show();
	} else {
		$('#survey_question_options').hide();
	}
}