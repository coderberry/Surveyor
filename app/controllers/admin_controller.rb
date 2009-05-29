class AdminController < ApplicationController
  before_filter :authenticate
  
  def index
    redirect_to admin_surveys_path
  end
  
  protected
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "foo" && password == "bar"
    end
  end
end
