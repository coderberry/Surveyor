require 'test_helper'

class SurveysControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Surveys.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Surveys.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Surveys.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to surveys_url(assigns(:surveys))
  end
  
  def test_edit
    get :edit, :id => Surveys.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Surveys.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Surveys.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Surveys.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Surveys.first
    assert_redirected_to surveys_url(assigns(:surveys))
  end
  
  def test_destroy
    surveys = Surveys.first
    delete :destroy, :id => surveys
    assert_redirected_to surveys_url
    assert !Surveys.exists?(surveys.id)
  end
end
